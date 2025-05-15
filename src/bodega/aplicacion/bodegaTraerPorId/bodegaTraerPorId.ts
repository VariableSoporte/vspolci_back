import {
  Bodega,
  BodegaId,
  BodegaNoEncontradaError,
  BodegaRepositorio,
} from "../../dominio";

export class BodegaTraerPorId {
  constructor(private repositorio: BodegaRepositorio) {}

  async handle(id: number): Promise<Bodega> {
    const bodega = await this.repositorio.traerPorId(new BodegaId(id));
    if (!bodega) throw new BodegaNoEncontradaError("Bodega no encontrado");
    return bodega;
  }
}
