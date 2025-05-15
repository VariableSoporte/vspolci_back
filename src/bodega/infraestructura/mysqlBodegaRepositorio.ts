import {
  RowDataPacket
} from "mysql2/promise";
import bd from "../../database/database";
import {
  Bodega,
  BodegaCiudad,
  BodegaId,
  BodegaNombre,
  BodegaRepositorio,
  BodegaZona,
} from "../dominio";

type BodegaMySQL = {
  id_bodega: number;
  nombre: string;
  ciudad: string;
  zona: string;
};

export class MySQLBodegaRepositorio implements BodegaRepositorio {

  
  async crear(bodega: Bodega): Promise<void> {
    const query = "CALL crear_bodega (?,?,?)";
    const values = [
      bodega.nombre.value,
      bodega.ciudad.value,
      bodega.zona.value
    ];
    //await db.query(query, values);
    
    await bd.query<RowDataPacket[]>(query, values);
  }

  async traerTodo(): Promise<Bodega[]> {
    const query = "CALL traer_todas_bodegas()";

    const rows = await bd.query<RowDataPacket[]>(query);

    const bodega = rows[0].map(
      (b:BodegaMySQL) =>
        new Bodega(
          new BodegaId(b.id_bodega),
          new BodegaNombre(b.nombre),
          new BodegaCiudad(b.ciudad),
          new BodegaZona(b.zona)
        )
    );
    return bodega;
  }

  async traerPorId(id: BodegaId): Promise<Bodega | null> {
    const query ="CALL traer_bodega_id(?)";
    const values = id.value;

    //const rows = await this.cliente.query<RowDataPacket[]>(query, values); // -> se usa rows[0][0]
    const rows = await bd.query<RowDataPacket[]>(query, values); // -> se usa solo rows[0]

    //console.log(rows);
    if (rows[0].length === 0) {
      return null;
    }
    const usuarios = rows[0].map(
      (u:BodegaMySQL) =>
        new Bodega(
          new BodegaId(u.id_bodega),
          new BodegaNombre(u.nombre),
          new BodegaCiudad(u.ciudad),
          new BodegaZona(u.zona)
        )
    );

    return usuarios[0];
  }

  async editar(bodega: Bodega): Promise<void> {
    const query = "CALL editar_bodega(?, ?, ?, ?)";
    const values = [
      bodega.id.value,
      bodega.nombre.value,
      bodega.ciudad.value,
      bodega.zona.value
    ]
    await bd.query<RowDataPacket[]>(query, values);
  }
  
  async eliminar(id: BodegaId): Promise<void> {
    const query = "CALL eliminar_bodega(?)";
    const values = [ 
      id.value
    ]
    await bd.query<RowDataPacket[]>(query, values);

  }

  
}
