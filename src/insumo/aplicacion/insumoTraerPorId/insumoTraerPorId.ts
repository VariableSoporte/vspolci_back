import { Insumo, InsumoId, InsumoNoEncontradoError, InsumoRepositorio } from "../../dominio";

export class InsumoTraerPorId {
    constructor ( private repositorio: InsumoRepositorio){}

    async handle (id: number): Promise <Insumo> {
        const insumo = await this.repositorio.traerPorId(new InsumoId(id));

        if (!insumo) throw new InsumoNoEncontradoError ("Insumo no encontrado"); //aqui se pued eretornar error 404

        return insumo;
    }
}