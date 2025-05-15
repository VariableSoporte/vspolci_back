import { Usuario, UsuarioApellido, UsuarioContrasenia, UsuarioCorreo, UsuarioId, UsuarioIdBodega, UsuarioNombre, UsuarioPermiso, UsuarioRepositorio } from "../../dominio";

export class UsuarioEditar {
    constructor (private repositorio: UsuarioRepositorio) {}

    async handle (id: number, nombre: string, apellido: string, correo: string, contrasenia: string, activo: number, id_bodega: number[], permiso: number) : Promise<void>{
        const usuario = new Usuario (
            new UsuarioId(id),
            new UsuarioNombre(nombre),
            new UsuarioApellido(apellido),
            new UsuarioCorreo(correo),
            new UsuarioContrasenia(contrasenia),
            activo,
            new UsuarioIdBodega(id_bodega),
            new UsuarioPermiso(permiso)
        );

        return this.repositorio.editar(usuario);
    }
}