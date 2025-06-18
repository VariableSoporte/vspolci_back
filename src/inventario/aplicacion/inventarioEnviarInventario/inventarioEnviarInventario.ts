import {
  Inventario,
  InventarioEnviar,
  InventarioNoEncontradoError,
  InventarioRepositorio,
} from "../../dominio";

export class InventarioEnviarInventario {
  constructor(private repositorio: InventarioRepositorio) {}

  async handle(enviar: InventarioEnviar): Promise<void> {
    try {
      return await this.repositorio.enviarInventario(enviar);
    } catch (error) {
      throw new InventarioNoEncontradoError(`No se pudo enviar el inventario`);
    }
  }
}
