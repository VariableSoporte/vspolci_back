import { Inventario, InventarioNoEncontradoError, InventarioRepositorio } from "../../dominio";

export class InventarioTraerTodo {
  constructor(private repositorio: InventarioRepositorio) {}

  async handle(id_bodega: number): Promise<Inventario[]> {
    const inventario = await this.repositorio.traerTodo(id_bodega);

    if (!inventario || inventario.length === 0) {
      throw new InventarioNoEncontradoError(
        `No se encontró inventario para la bodega con ID ${id_bodega}`
      );
    }

    return inventario;
  }
}
