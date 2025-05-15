import { Usuario, UsuarioId, UsuarioNoEncontradoError, UsuarioRepositorio } from "../../dominio";

export class UsuarioTraerPorId {
    constructor (private readonly repositorio : UsuarioRepositorio){}

    async handle (id: number): Promise <Usuario> {
        const usuario = await this.repositorio.traerPorId(new UsuarioId(id));

        if (!usuario) throw new UsuarioNoEncontradoError ("Usuario no encontrado"); //aqui se pued eretornar error 404

        return usuario;
    }
}