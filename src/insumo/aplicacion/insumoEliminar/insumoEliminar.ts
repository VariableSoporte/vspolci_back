import { InsumoId, InsumoRepositorio } from "../../dominio";

export class InsumoEliminar {
    constructor (private repositorio: InsumoRepositorio){}

    async handle (id: number):Promise<void>{
        return this.repositorio.eliminar(new InsumoId(id));
    }
}