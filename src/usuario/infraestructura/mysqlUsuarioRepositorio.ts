import mysql2, {
  ConnectionOptions,
  ResultSetHeader,
  RowDataPacket,
} from "mysql2/promise";
import bd from "../../database/database";
import {
  Usuario,
  UsuarioApellido,
  UsuarioContrasenia,
  UsuarioCorreo,
  UsuarioId,
  UsuarioIdBodega,
  UsuarioNombre,
  UsuarioPermiso,
  UsuarioRepositorio,
} from "../dominio";

type UsuarioMySQL = {
  id_usuario: number;
  nombres: string;
  apellidos: string;
  contrasenia: string;
  correo: string;
  activo: number;
  id_bodega_per: number[];
  permiso: number;
};

export class MySQLUsuarioRepositorio implements UsuarioRepositorio {

  async crear(usuario: Usuario): Promise<void> {
    const query =
    "CALL crear_asignar_usuario (?,?,?,?,?,?,?)";
    const values = [
      usuario.nombre.value,
      usuario.apellido.value,
      usuario.correo.value,
      usuario.contrasenia.value,
      usuario.activo,
      usuario.id_bodega.value,
      usuario.permiso.value
    ];
    //await db.query(query, values);
    
    await bd.query<RowDataPacket[]>(query, values);
  }

  async traerTodo(): Promise<Usuario[]> {
    const query =
      "CALL traer_todos_usuarios()";

    //const rows = (await this.cliente.query<RowDataPacket[]>(query)) as unknown as UsuarioMySQL[];
    const rows = await bd.query<RowDataPacket[]>(query);
    //const rows = await db.query(query);
    //console.log(rows[0][0]);

    const usuarios = rows[0].map(
      (u:UsuarioMySQL) =>
        new Usuario(
          new UsuarioId(u.id_usuario),
          new UsuarioNombre(u.nombres),
          new UsuarioApellido(u.apellidos),
          new UsuarioCorreo(u.correo),
          new UsuarioContrasenia(u.contrasenia),
          u.activo,
          new UsuarioIdBodega(u.id_bodega_per),
          new UsuarioPermiso(u.permiso)
        )
    );
    return usuarios;
  }

  async traerPorId(id: UsuarioId): Promise<Usuario | null> {
    const query ="CALL traer_usuario_id(?)";
    const values = id.value;
    //console.log(query);
    //const rows = await this.cliente.query<RowDataPacket[]>(query, values); // -> se usa rows[0][0]
    const rows = await bd.query<RowDataPacket[]>(query, values); // -> se usa solo rows[0]

    //console.log(rows);
    if (rows[0].length === 0) {
      return null;
    }
    const usuarios = rows[0].map(
      (u:UsuarioMySQL) =>
        new Usuario(
          new UsuarioId(u.id_usuario),
          new UsuarioNombre(u.nombres),
          new UsuarioApellido(u.apellidos),
          new UsuarioCorreo(u.correo),
          new UsuarioContrasenia(u.contrasenia),
          u.activo,
          new UsuarioIdBodega(u.id_bodega_per),
          new UsuarioPermiso(u.permiso)
        )
    );

    return usuarios[0];
  }

  async editar(usuario: Usuario): Promise<void> {
    const query = "CALL editar_usuario(?, ?, ?, ?, ?, ?, ?, ?)";
    const values = [
      usuario.id.value,
      usuario.nombre.value,
      usuario.apellido.value,
      usuario.correo.value,
      usuario.contrasenia.value,
      usuario.activo,
      usuario.id_bodega.value,
      usuario.permiso.value
    ]
    await bd.query<RowDataPacket[]>(query, values);
  }
  
  async eliminar(id: UsuarioId): Promise<void> {
    const query = "CALL eliminar_usuario(?)";
    const values = [
      id.value
    ]
    await bd.query<RowDataPacket[]>(query, values);

  }

  async autenticar(correo: UsuarioCorreo, contrasenia: UsuarioContrasenia): Promise<Usuario | null> {
    const query = "CALL login(?, ?)";
    const values = [
      correo.value,
      contrasenia.value
    ]
    const rows = await bd.query<RowDataPacket[]>(query, values);
    //const rows = await this.query(query, values);

    if (rows[0].length === 0) {
      return null;
    }
    
    const usuarios = rows[0].map(
      (u:UsuarioMySQL) =>
        new Usuario(
          new UsuarioId(u.id_usuario),
          new UsuarioNombre(u.nombres),
          new UsuarioApellido(u.apellidos),
          new UsuarioCorreo(u.correo),
          new UsuarioContrasenia(u.contrasenia),
          u.activo,
          new UsuarioIdBodega(u.id_bodega_per),
          new UsuarioPermiso(u.permiso)
        )
    );

    return usuarios[0];
  }
}

