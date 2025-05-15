import {
  UsuarioApellido,
  UsuarioContrasenia,
  UsuarioCorreo,
  UsuarioId,
  UsuarioIdBodega,
  UsuarioNombre,
  UsuarioPermiso,
} from "./index";

export class Usuario {
  id: UsuarioId;
  nombre: UsuarioNombre;
  apellido: UsuarioApellido;
  correo: UsuarioCorreo;
  contrasenia: UsuarioContrasenia;
  activo: number;
  id_bodega: UsuarioIdBodega;
  permiso: UsuarioPermiso;

  constructor(
    id: UsuarioId,
    nombre: UsuarioNombre,
    apellido: UsuarioApellido,
    correo: UsuarioCorreo,
    contrasenia: UsuarioContrasenia,
    activo: number,
    id_bodega: UsuarioIdBodega,
    permiso: UsuarioPermiso
  ) {
    this.id = id;
    this.nombre = nombre;
    this.apellido = apellido;
    this.correo = correo;
    this.contrasenia = contrasenia;
    this.activo = activo;
    this.id_bodega = id_bodega;
    this.permiso = permiso;
  }

  public datoPrimitivo() {
    return {
      id: this.id.value,
      nombre: this.nombre.value,
      apellido: this.apellido.value,
      correo: this.correo.value,
      contrasenia: this.contrasenia.value,
      activo: this.activo,
      id_bodega: this.id_bodega.value,
      permiso: this.permiso.value,
    };
  }
}
