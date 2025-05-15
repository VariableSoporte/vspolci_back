import mysql2, {
  ConnectionOptions,
  ResultSetHeader,
  RowDataPacket,
} from "mysql2/promise";
import bd from "../../database/database";
import {
  Insumo,
  InsumoActivo,
  InsumoCantidad,
  InsumoCategoria,
  InsumoCodigo,
  InsumoDescripcion,
  InsumoId,
  InsumoMedida,
  InsumoNombre,
  InsumoRepositorio
} from "../dominio";

type InsumoMySQL = {
  id_producto: number;
  nombre: string;
  descripcion: string;
  cantidad_paquete: number;
  nombre_medida: string;
  categoria: string;
  codigo: string;
  activo: number;
};

export class MySQLInsumoRepositorio implements InsumoRepositorio {

  async crear(insumo: Insumo): Promise<void> {
    const query =
    "CALL crear_insumo (?, ?, ?, ?, ?, ?, ?)";
    const values = [
      insumo.nombre.value,
      insumo.descripcion.value,
      insumo.cantidad_paquete.value,
      insumo.medida.value,
      insumo.categoria.value,
      insumo.codigo.value,
      insumo.activo.value
    ];
    //await db.query(query, values);
    
    await bd.query<RowDataPacket[]>(query, values);
  }

  async traerTodo(): Promise<Insumo[]> {
    const query = "CALL traer_todos_insumos()";

    //const rows = (await this.cliente.query<RowDataPacket[]>(query)) as unknown as UsuarioMySQL[];
    const rows = await bd.query<RowDataPacket[]>(query);
    //const rows = await db.query(query);
    //console.log(rows[0][0]);

    const insumo = rows[0].map(
      (u:InsumoMySQL) =>
        new Insumo(
          new InsumoId(u.id_producto),
          new InsumoNombre(u.nombre),
          new InsumoDescripcion(u.descripcion),
          new InsumoCantidad(u.cantidad_paquete),
          new InsumoMedida(u.nombre_medida),
          new InsumoCategoria(u.categoria),
          new InsumoCodigo(u.codigo),
          new InsumoActivo(u.activo)
        )
    );
    return insumo;
  }

  async traerPorId(id: InsumoId): Promise<Insumo | null> {
    const query ="CALL traer_insumo_id(?)";
    const values = id.value;

    //const rows = await this.cliente.query<RowDataPacket[]>(query, values); // -> se usa rows[0][0]
    const rows = await bd.query<RowDataPacket[]>(query, values); // -> se usa solo rows[0]

    //console.log(rows);
    if (rows[0].length === 0) {
      return null;
    }
    const insumo = rows[0].map(
      (u:InsumoMySQL) =>
        new Insumo(
          new InsumoId(u.id_producto),
          new InsumoNombre(u.nombre),
          new InsumoDescripcion(u.descripcion),
          new InsumoCantidad(u.cantidad_paquete),
          new InsumoMedida(u.nombre_medida),
          new InsumoCategoria(u.categoria),
          new InsumoCodigo(u.codigo),
          new InsumoActivo(u.activo)
        )
    );

    return insumo[0];
  }

  async editar(insumo: Insumo): Promise<void> {
    const query = "CALL editar_insumo (?, ?, ?, ?, ?, ?, ?, ?)";
    const values = [
      insumo.id.value,
      insumo.nombre.value,
      insumo.descripcion.value,
      insumo.cantidad_paquete.value,
      insumo.medida.value,
      insumo.categoria.value,
      insumo.codigo.value,
      insumo.activo.value
    ]
    await bd.query<RowDataPacket[]>(query, values);
  }
  
  async eliminar(id: InsumoId): Promise<void> {
    const query = "CALL eliminar_insumo(?)";
    const values = [
      id.value
    ]
    await bd.query<RowDataPacket[]>(query, values);

  }

}
