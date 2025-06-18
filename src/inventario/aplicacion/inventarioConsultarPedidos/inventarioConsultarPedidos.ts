import { EstadosPedidos, InventarioNoEncontradoError, InventarioRepositorio } from "../../dominio";

export class InventarioConsultarPedidos {
  constructor(private repositorio: InventarioRepositorio) {}

  async handle(id_bodega: number): Promise<EstadosPedidos[]> {
    try {
      return await this.repositorio.consultarPedidos(id_bodega);
    } catch (error) {
      console.log("error real: ",error); 
      throw new InventarioNoEncontradoError(`No se pudo enviar el Consultar Pedidos`);
    }
  }
}
