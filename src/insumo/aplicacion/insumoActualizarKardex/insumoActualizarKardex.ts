import { InsumoRepositorio } from "insumo/dominio";

export class InsumoActualizarKardex {
  constructor(private repositorio: InsumoRepositorio) {}

  async handle(
    id_kardex: number,
    estante: string,
    fila: number
  ): Promise<void> {
    return await this.repositorio.actualizarKardex(id_kardex,estante,fila);
  }
}