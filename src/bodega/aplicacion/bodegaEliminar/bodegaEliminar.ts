import { BodegaId, BodegaRepositorio } from "../../dominio";

export class BodegaEliminar {
    constructor (private repositorio: BodegaRepositorio){}

    async handle (id: number): Promise<void>{
        await this.repositorio.eliminar(new BodegaId(id));
    }
}