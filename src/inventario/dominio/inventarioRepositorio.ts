import {
  EstadosPedidos,
  Inventario,
  InventarioEnviar,
  InventarioSolicitud,
} from "./index";

export interface InventarioRepositorio {
  traerTodo(id_bodega: number): Promise<Inventario[]>;
  enviarInventario(entrega: InventarioEnviar): Promise<void>;
  enviarSolicitud(solicitud: InventarioSolicitud): Promise<void>;
  consultarEstados(id_bodega: number): Promise<EstadosPedidos[]>;
  consultarPedidos(id_bodega: number): Promise<EstadosPedidos[]>;
  enviarPedidos(entrega: InventarioEnviar): Promise<void>;
  aprobarSolicitudYGenerarMovimientos(
    id_solicitud: number,
    id_usuario_aprueba: number,
    productos: {
      id_detalle_solicitud: number;
      cantidad_a_enviar: number;
      id_kardex_per: number;
      id_producto_per: number;
    }[]
  ): Promise<void>;
}
