import { UsuarioId, UsuarioRepositorio } from "../../dominio";

export class UsuarioEliminar {
    constructor (private repositorio: UsuarioRepositorio){}

    async handle (id: number): Promise<void>{
        await this.repositorio.eliminar(new UsuarioId(id));
    }
}