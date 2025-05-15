import { Bodega, BodegaRepositorio } from "../../dominio";

export class BodegaTraerTodo {
    constructor (private repositorio: BodegaRepositorio){}

    async handle ():Promise<Bodega[]>{
        return this.repositorio.traerTodo();
    }
}