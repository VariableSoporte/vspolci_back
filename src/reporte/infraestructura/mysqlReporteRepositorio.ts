import { RowDataPacket } from "mysql2/promise";
import bd from "../../database/database";
import { ReporteInsumos, ReporteRepositorio } from "../dominio";

type ReporteMySQL = {
  id_producto: number;
  nombre: string;
  descripcion: string;
  cantidad_paquete: number;
  activo: number;
  total: number;
};

export class MySQLReporteRepositorio implements ReporteRepositorio {
  async reporteInsumos(): Promise<ReporteInsumos[]> {
    const query = `select p.id_producto, p.nombre, p.descripcion, p.cantidad_paquete, p.activo, sum(cantidad) as total
                    from producto p left join kardex k on p.id_producto = k.id_producto_per
                    GROUP BY p.id_producto
                    ORDER BY total DESC`;
    const rows = await bd.query<RowDataPacket[]>(query);
    console.log(rows);
    const reporte = rows.map((r: any) => {
      return new ReporteInsumos(
        r.id_producto,
        r.nombre,
        r.descripcion,
        r.cantidad_paquete,
        r.activo,
        r.total || 0
      );
    });
    return reporte;
  }
  async reporteSalidas(): Promise<any[]> {
    const query = `SELECT s.id_salida, s.fecha_salida, s.cantidad, p.nombre, p.id_producto
                    FROM salida s 
                    INNER JOIN kardex k ON s.id_kardex_per = k.id_kardex 
                    RIGHT JOIN producto p ON p.id_producto = k.id_producto_per
                    ORDER BY s.id_salida DESC`;
    const rows = await bd.query<RowDataPacket[]>(query);
    console.log(rows);
    const reporte = rows.map((r: any) => {
      return {
        id_salida: r.id_salida,
        fecha_salida: r.fecha_salida,
        cantidad: r.cantidad,
        nombre: r.nombre,
        id_producto: r.id_producto,
      };
    });
    return reporte;
  }
  async reporteSalidasBodegas(): Promise<any[]> {
    const query = `select b.id_bodega, b.nombre, b.ciudad, s.fecha_salida, s.cantidad
                  from bodega b 
                  LEFT JOIN kardex k ON b.id_bodega = k.id_bodega_per 
                  LEFT JOIN salida s ON k.id_kardex = s.id_kardex_per;
                  `;
    const rows = await bd.query<RowDataPacket[]>(query);
    const reporte = rows.map((r: any) => {
      return {
        id_bodega: r.id_bodega,
        nombre: r.nombre,
        ciudad: r.ciudad,
        fecha_salida: r.fecha_salida,
        cantidad: r.cantidad,
      };
    });
    return reporte;
  };
  async reporteEntregas(id_bodega: number): Promise<any[]> {
    const query = `select s.id_salida, k.id_kardex, p.nombre as insumo, s.cantidad, s.fecha_salida, b.nombre as bodega, b.ciudad
                  from salida s 
                  RIGHT JOIN kardex k ON s.id_kardex_per = k.id_kardex 
                  INNER JOIN bodega b ON k.id_bodega_per = b.id_bodega 
                  INNER JOIN producto p ON k.id_producto_per = p.id_producto
                  WHERE b.id_bodega = ?`;
    const values = [id_bodega];
    const rows = await bd.query<RowDataPacket[]>(query,values);
    const reporte = rows.map((r: any)=>{
      return {
        id_salida: r.id_salida,
        id_kardex: r.id_kardex,
        insumo: r.insumo,
        cantidad: r.cantidad,
        fecha_salida: r.fecha_salida,
        bodega: r.bodega,
        ciudad: r.ciudad
      }
    });
    return reporte;
  }
  /*
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
  
  */
}
