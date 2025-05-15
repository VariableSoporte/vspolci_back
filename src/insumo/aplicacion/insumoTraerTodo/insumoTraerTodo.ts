import { Insumo, InsumoRepositorio } from "../../dominio";

export class InsumoTraerTodo {
    constructor (private repositorio: InsumoRepositorio){}

    async handle ():Promise<Insumo[]>{
        return this.repositorio.traerTodo();
    }
}