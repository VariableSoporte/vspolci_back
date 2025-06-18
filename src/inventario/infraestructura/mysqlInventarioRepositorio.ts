import {
  EstadosPedidos,
  Inventario,
  InventarioEnviar,
  InventarioRepositorio,
  InventarioSolicitud,
} from "../dominio";
import bd, { pool } from "../../database/database";
import { ResultSetHeader, RowDataPacket } from "mysql2/promise";

type InventarioMySQL = {
  id_kardex: number;
  nombre: string;
  descripcion: string;
  cantidad: number;
  cantidad_paquete: number;
  nombre_medida: string;
  categoria: string;
  codigo: string;
  estante: string;
  fila: number;
  id_producto: number;
};

export class MySQLInventarioRepositorio implements InventarioRepositorio {
  async traerTodo(id_bodega: number): Promise<Inventario[]> {
    const query = "CALL traer_todo_inventario (?)";
    const values = [id_bodega];
    const rows = await bd.query<RowDataPacket[]>(query, values);
    const inventario = rows[0].map(
      (u: InventarioMySQL) =>
        new Inventario(
          u.id_kardex,
          u.nombre,
          u.descripcion,
          u.cantidad,
          u.cantidad_paquete,
          u.nombre_medida,
          u.categoria,
          u.codigo,
          u.estante,
          u.fila,
          u.id_producto
        )
    );
    return inventario;
  }
  async enviarInventario(entrega: InventarioEnviar): Promise<void> {
    const query = "CALL registrar_salida_insumo (?,?,?,?,?,?)";
    const values = [
      entrega.id_kardex_per,
      entrega.cantidad,
      entrega.numero_informe,
      entrega.nombre_solicitante,
      entrega.area,
      entrega.disposicion_entrega,
    ];
    await bd.query<RowDataPacket[]>(query, values);
  }
  async enviarPedidos(entrega: InventarioEnviar): Promise<void> {
    const query = "CALL registrar_salida_insumo (?,?,?,?,?,?)";
    const values = [
      entrega.id_kardex_per,
      entrega.cantidad,
      entrega.numero_informe,
      entrega.nombre_solicitante,
      entrega.area,
      entrega.disposicion_entrega,
    ];
    await bd.query<RowDataPacket[]>(query, values);
  }

  async enviarSolicitud(solicitud: InventarioSolicitud): Promise<void> {
    const conn = await pool.getConnection();
    try {
      await conn.beginTransaction();
      // 1. Insertar en solicitud
      const [resultado] = await conn.query<ResultSetHeader>(
        `INSERT INTO solicitud (id_bodega_per, id_bodega_sol, fecha_emision, fecha_aprobado, aprobado, id_usuario_sol, id_usuario_aprueba)
       VALUES (?, ?, ?, NULL, 0, ?, NULL)`,
        [
          solicitud.id_bodega_per,
          solicitud.id_bodega_sol,
          solicitud.fecha_emision,
          solicitud.id_usuario_sol,
        ]
      );

      const id_solicitud = resultado.insertId;
      console.log(resultado);

      if (!Array.isArray(solicitud.pedido)) {
        console.error("solicitud.pedido no es un array:", solicitud.pedido);
        throw new Error("Formato de pedido inválido");
      }

      // 2. Insertar los productos del pedido
      for (const item of solicitud.pedido) {
        await conn.query(
          `INSERT INTO detalle_solicitud 
          (id_solicitud_per, id_producto_per, cantidad, motivo, detalle_solicitudcol, cantidad_enviada)
         VALUES (?, ?, ?, ?, ?, 0)`,
          [
            id_solicitud,
            item.id_producto_per,
            item.cantidad,
            item.motivo,
            item.detalle_solicitud,
          ]
        );
      }

      await conn.commit();
    } catch (error) {
      await conn.rollback();
      console.error("Error real en MySQLInventarioRepositorio:", error);
      throw new Error("No se pudo enviar la solicitud");
    } finally {
      conn.release();
    }
  }
  async consultarEstados(id_bodega: number): Promise<EstadosPedidos[]> {
    const query = "CALL listado_de_estados(?)";
    const values = [id_bodega];
    const result = await bd.query<RowDataPacket[]>(query, values);

    // result[0] contiene los resultados de la consulta (ya que CALL retorna array de arrays)
    return result[0].map((row: any) => ({
      id_solicitud: row.id_solicitud,
      nombre_bodega: row.nombre_bodega,
      fecha_emision: row.fecha_emision,
      fecha_aprobado: row.fecha_aprobado,
      usuario_solicitante: row.usuario_solicitante,
      usuario_aprobador: row.usuario_aprobador,
      productos:
        typeof row.productos === "string"
          ? JSON.parse(row.productos)
          : row.productos,
    }));
  }
  async consultarPedidos(id_bodega: number): Promise<EstadosPedidos[]> {
    const query = "CALL listado_de_pedidos(?)";
    const values = [id_bodega];
    const result = await bd.query<RowDataPacket[]>(query, values);

    // result[0] contiene los resultados de la consulta (ya que CALL retorna array de arrays)
    return result[0].map((row: any) => ({
      id_solicitud: row.id_solicitud,
      nombre_bodega: row.nombre_bodega,
      fecha_emision: row.fecha_emision,
      fecha_aprobado: row.fecha_aprobado,
      usuario_solicitante: row.usuario_solicitante,
      usuario_aprobador: row.usuario_aprobador,
      productos:
        typeof row.productos === "string"
          ? JSON.parse(row.productos)
          : row.productos,
    }));
  }

  async aprobarSolicitudYGenerarMovimientos(
    id_solicitud: number,
    id_usuario_aprueba: number,
    productos: {
      id_detalle_solicitud: number;
      cantidad_a_enviar: number;
      id_kardex_per: number;
      id_producto_per: number;
    }[]
  ): Promise<void> {
    const conn = await pool.getConnection();
    console.log("id_solicitud: ", id_solicitud);
    console.log("id_usuario_aprueba: ", id_usuario_aprueba);
    console.log("productos: ", productos);
    try {
      await conn.beginTransaction();

      for (const {
        id_detalle_solicitud,
        cantidad_a_enviar,
        id_kardex_per,
        id_producto_per,
      } of productos) {
        // actualizar el detalle por cada producto
        await conn.query<any[]>(
          `
        UPDATE detalle_solicitud 
        SET cantidad_enviada = ?
        WHERE id_detalle_solicitud = ?
      `,
          [cantidad_a_enviar, id_detalle_solicitud]
        );

        // Obtener entradas disponibles en bodega de origen
        const [entradas]: any[] = await conn.query(
          `
        SELECT * FROM entrada
        WHERE id_kardex_per = ? AND existencia > 0
        ORDER BY fecha_entrada ASC
      `,
          [id_kardex_per]
        );

        const verificar = entradas;
        console.log("verificando vueltas"); // -> hasta aqui bien
        console.log("entradas: ", verificar); // -> hasta aqui bien

        let cantidadRestante = cantidad_a_enviar;
        //si entradas esta en null, no entrara por este for, ya que no hay insumos que entregar
        for (const entrada of entradas) {
          if (cantidadRestante <= 0) break;

          const aConsumir = Math.min(cantidadRestante, entrada.existencia);

          // 0. traer data necesaria
          const [datos]: any[] = await conn.query(
            `select nombre, ciudad, zona from bodega where id_bodega = (select id_bodega_sol from solicitud where id_solicitud = ?)`,
            [id_solicitud]
          );

          // 1. Insertar salida en bodega origen
          await conn.query(
            `
          INSERT INTO salida (
            id_kardex_per, numero_informe, cantidad, fecha_salida,
            id_entrada_per, nombre_solicitante, area, disposicion_entrega
          ) VALUES (?, ?, ?, CURRENT_DATE, ?, ?,?,?)
        `,
            [
              id_kardex_per,
              `OFICIO-${id_solicitud}`,
              aConsumir,
              entrada.id_entrada,
              datos[0].nombre,
              datos[0].ciudad,
              datos[0].zona,
            ]
          );

          // 2. Restar existencia en entrada origen
          await conn.query(
            `UPDATE entrada SET existencia = existencia - ? WHERE id_entrada = ?`,
            [aConsumir, entrada.id_entrada]
          );

          // 3. Obtener o crear kardex en bodega destino
          const [[kardexDestino]] = await conn.query<any[]>(
            `
          SELECT * FROM kardex WHERE id_producto_per = ? AND id_bodega_per = (select id_bodega_per from solicitud where id_solicitud = ?)
        `,
            [id_producto_per, id_solicitud]
          );

          let idKardexDestino = kardexDestino?.id_kardex;

          if (!idKardexDestino) {
            const [res]: any = await conn.query(
              `
            INSERT INTO kardex (id_producto_per, id_bodega_per, cantidad, estante, fila)
            VALUES (?, (select id_bodega_per from solicitud where id_solicitud = ?), 0, 'S/E', 1)
          `,
              [id_producto_per, id_solicitud]
            );
            idKardexDestino = res.insertId; //ojo con este id, necesito tener el id del insert que se acaba de hacer
            console.log("id kardex creada: ", idKardexDestino);
          }

          // 4. Insertar entrada en bodega destino
          await conn.query(
            `
          INSERT INTO entrada (
            id_kardex_per, numero_oficio, cantidad, existencia, fecha_entrada, fecha_caducidad, nombre_entrada
          ) VALUES (?, ?, ?, ?, CURRENT_DATE, ?, (select concat("transferido por: ", nombre) from bodega where id_bodega = (select id_bodega_sol from solicitud where id_solicitud = ?)))
        `,
            [
              idKardexDestino,
              `OFICIO ${id_solicitud}`,
              aConsumir,
              aConsumir,
              entrada.fecha_caducidad,
              id_solicitud,
            ]
          );

          cantidadRestante -= aConsumir;
        }

        // 5. Actualizar cantidad en kardex origen

        await conn.query(
          `
        UPDATE kardex SET cantidad = (SELECT IFNULL(SUM(existencia), 0) FROM entrada WHERE id_kardex_per = ?)
         WHERE id_kardex = ?
      `,
          [id_kardex_per, id_kardex_per]
        );
        console.log("linea 297");
        // 6. Obtener kardex destino
        const kar_dex: any[] = await conn.query(
          `
          SELECT * FROM kardex WHERE id_producto_per = ? AND id_bodega_per = (select id_bodega_per from solicitud where id_solicitud = ?)
          `,
          [id_producto_per, id_solicitud]
        );
        console.log("tipo: ", kar_dex[0][0]);

        if (kar_dex[0][0]!==undefined) {
          const id_kardex_destino = kar_dex[0][0].id_kardex || 0;

          console.log("id_kardex_destino: ", id_kardex_destino);
          console.log("kar_dex", kar_dex);
          // 7. Actualizar cantidad en kardex destino
          await conn.query(
            `
        UPDATE kardex SET cantidad = (SELECT IFNULL(SUM(existencia), 0) FROM entrada WHERE id_kardex_per = ?)  WHERE id_kardex = ?
      `,
            [id_kardex_destino, id_kardex_destino]
          );
        }
      }
      // 7. Marcar solicitud como aprobada
      await conn.query(
        `
      UPDATE solicitud
      SET aprobado = 1,
          fecha_aprobado = CURRENT_DATE,
          id_usuario_aprueba = ?
      WHERE id_solicitud = ?
    `,
        [id_usuario_aprueba, id_solicitud]
      );

      await conn.commit();
    } catch (err) {
      await conn.rollback();
      console.error("Error al aprobar y transferir productos:", err);
      throw new Error("No se pudo aprobar la solicitud");
    } finally {
      conn.release();
    }
  }
}
