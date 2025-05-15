import { Usuario, UsuarioRepositorio } from "../../dominio";

export class UsuarioTraerTodo {
    constructor (private repositorio : UsuarioRepositorio) {}

    async run(): Promise <Usuario[]>{
        return this.repositorio.traerTodo();
    }
}