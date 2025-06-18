import { InsumoKardex, InsumoNoEncontradoError, InsumoRepositorio } from "../../dominio";

export class InsumoTraerPorBodega {
    constructor ( private repositorio: InsumoRepositorio){}

    async handle (id_bodega_per: number): Promise <InsumoKardex[]> {
        const insumo = await this.repositorio.traerPorBodega(id_bodega_per);

        if (!insumo) throw new InsumoNoEncontradoError ("Insumo por bodega no encontrado"); //aqui se pued eretornar error 404

        return insumo;
    }
}