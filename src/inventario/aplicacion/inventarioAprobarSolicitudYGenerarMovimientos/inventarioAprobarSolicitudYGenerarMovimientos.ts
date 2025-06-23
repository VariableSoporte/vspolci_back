import {
  EstadosPedidos,
  InventarioNoEncontradoError,
  InventarioRepositorio,
} from "../../dominio";

export class InventarioAprobarSolicitudYGenerarMovimientos {
  constructor(private repositorio: InventarioRepositorio) {}

  async handle(
    id_solicitud: number,
    id_usuario_aprueba: number,
    productos: {
      id_detalle_solicitud: number;
      cantidad_a_enviar: number;
      id_kardex_per: number;
      id_producto_per: number;
    }[]
  ): Promise<void> {
    try {
      return await this.repositorio.aprobarSolicitudYGenerarMovimientos(
        id_solicitud,
        id_usuario_aprueba,
        productos
      );
    } catch (error) {
      throw new InventarioNoEncontradoError(
        `No se pudo enviar el Aprobar y generar movimientos`
      );
    }
  }
}
