import {
  InventarioNoEncontradoError,
  InventarioRepositorio,
  InventarioSolicitud,
} from "../../dominio";

export class InventarioEnviarSolicitud {
  constructor(private repositorio: InventarioRepositorio) {}

  async handle(enviar: InventarioSolicitud): Promise<void> {
    try {
      return await this.repositorio.enviarSolicitud(enviar);
    } catch (error) {
      console.log("error real: ",error); 
      throw new InventarioNoEncontradoError(`No se pudo enviar el inventario solicitud`);
    }
  }
}