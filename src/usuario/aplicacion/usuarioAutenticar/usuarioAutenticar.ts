import { Usuario, UsuarioContrasenia, UsuarioCorreo, UsuarioId, UsuarioNoEncontradoError, UsuarioRepositorio } from "../../dominio";

export class UsuarioAutenticar {
    constructor (private readonly repositorio : UsuarioRepositorio){}

    async handle (correo: string, contrasenia: string): Promise <Usuario> {
        const usuario = await this.repositorio.autenticar(new UsuarioCorreo(correo), new UsuarioContrasenia(contrasenia));

        if (!usuario) throw new UsuarioNoEncontradoError ("Credenciales invalidas"); //aqui se pued eretornar error 404

        return usuario;
    }
}