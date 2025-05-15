import { Bodega, BodegaCiudad, BodegaId, BodegaNombre, BodegaRepositorio, BodegaZona } from "../../dominio";

export class BodegaCrear {
    constructor (private repositorio: BodegaRepositorio) {}

    async handle (id: number, nombre: string, ciudad: string, zona:string): Promise <void>{
        const bodega = new Bodega (
            new BodegaId(id),
            new BodegaNombre(nombre),
            new BodegaCiudad(ciudad),
            new BodegaZona(zona)
        )
        return this.repositorio.crear(bodega);
    }
}