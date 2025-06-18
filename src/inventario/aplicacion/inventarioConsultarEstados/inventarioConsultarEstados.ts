import { EstadosPedidos, InventarioNoEncontradoError, InventarioRepositorio } from "../../dominio";

export class InventarioConsultarEstados {
  constructor(private repositorio: InventarioRepositorio) {}

  async handle(id_bodega: number): Promise<EstadosPedidos[]> {
    try {
      return await this.repositorio.consultarEstados(id_bodega);
    } catch (error) {
      console.log("error real: ",error); 
      throw new InventarioNoEncontradoError(`No se pudo enviar el Consultar Estados`);
    }
  }
}
