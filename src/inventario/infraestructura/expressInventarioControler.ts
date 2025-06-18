import { NextFunction, Request, Response } from "express";
import { ServiciosContenedor } from "../../compartir/infraestructura/serviciosContenedor";
import {
  dato,
  EstadosPedidos,
  InventarioEnviar,
  InventarioNoEncontradoError,
  InventarioSolicitud,
} from "../dominio";

export class ExpressInventarioControler {
  async traerTodo(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      const id_bodega: number = parseInt(req.params.id_bodega);

      if (isNaN(id_bodega)) {
        return res.status(400).json({
          message: "Verifique los datos de la ruta de forma apropiada",
        });
      }

      const inventario = await ServiciosContenedor.inventario.traerTodo.handle(
        id_bodega
      );
      //console.log(inventario);
      return res.json(inventario.map((u) => u.datoPrimitivo())).status(200);
    } catch (error) {
      if (error instanceof InventarioNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      }
      throw error;
    }
  }

  async enviarInventario(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      const {
        id_kardex_per,
        numero_informe,
        cantidad,
        nombre_solicitante,
        area,
        disposicion_entrega,
      } = req.body as {
        id_kardex_per: number;
        numero_informe: string;
        cantidad: number;
        nombre_solicitante: string;
        area: string;
        disposicion_entrega: string;
      };

      const enviarData: InventarioEnviar = new InventarioEnviar(
        id_kardex_per,
        numero_informe,
        cantidad,
        "",
        "",
        nombre_solicitante,
        area,
        disposicion_entrega
      );

      await ServiciosContenedor.inventario.enviarInventario.handle(enviarData);
      return res.status(201).json("Inventario entregado con exito");
    } catch (error) {
      if (error instanceof InventarioNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      } else {
        return res.status(401).json({
          message:
            error instanceof Error
              ? error.message
              : "Error desconocido en el controlador de express inventarioEnviar",
        });
      }
    }
  }
  async enviarSolicitud(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      const {
        id_bodega_per,
        id_bodega_sol,
        fecha_emision,
        id_usuario_sol,
        pedido,
      } = req.body as {
        id_bodega_per: number;
        id_bodega_sol: number;
        fecha_emision: string;
        id_usuario_sol: number;
        pedido: dato[];
      };

      console.log("Tipo de pedido recibido:", typeof pedido);
      console.log("¿Es array?", Array.isArray(pedido));
      console.log("Contenido del pedido:", pedido);

      const InventarioEnviarSolicitud: InventarioSolicitud =
        new InventarioSolicitud(
          id_bodega_per,
          id_bodega_sol,
          fecha_emision,
          "",
          0,
          id_usuario_sol,
          0,
          pedido
        );
      await ServiciosContenedor.inventario.enviarSolicitud.handle(
        InventarioEnviarSolicitud
      );
      return res.status(201).json("Inventario entregado con exito");
    } catch (error) {
      if (error instanceof InventarioNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      } else {
        return res.status(401).json({
          message:
            error instanceof Error
              ? error.message
              : "Error desconocido en el controlador de express inventarioEnviarSolicitud",
        });
      }
    }
  }
  async consultarEstados(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      const id_bodega: number = parseInt(req.params.id_bodega);

      if (isNaN(id_bodega)) {
        return res.status(400).json({ message: "ID de bodega inválido" });
      }

      const resultado =
        await ServiciosContenedor.inventario.consultarEstados.handle(id_bodega);
      return res.status(200).json(resultado);
    } catch (error) {
      console.error("Error en consultarEstados:", error);
      return res.status(500).json({ message: "Error al consultar estados" });
    }
  }
  async consultarPedidos(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      const id_bodega: number = parseInt(req.params.id_bodega);

      if (isNaN(id_bodega)) {
        return res.status(400).json({ message: "ID de bodega inválido" });
      }

      const resultado =
        await ServiciosContenedor.inventario.consultarPedidos.handle(id_bodega);
      return res.status(200).json(resultado);
    } catch (error) {
      console.error("Error en consultarPedidos:", error);
      return res.status(500).json({ message: "Error al consultar pedidos" });
    }
  }
  async aprobarSolicitudYGenerarMovimientos(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      const { id_solicitud, id_usuario_aprueba, productos_aprobados } =
        req.body as {
          id_solicitud: number;
          id_usuario_aprueba: number;
          productos_aprobados: {
            id_detalle_solicitud: number;
            cantidad_a_enviar: number;
            id_kardex_per: number;
            id_producto_per: number;
          }[];
        };
      const resultado =
        await ServiciosContenedor.inventario.aprobarSolicitudYGenerarMovimientos.handle(
          id_solicitud,
          id_usuario_aprueba,
          productos_aprobados
        );
      return res.status(201).json("Inventario entregado con exito");
    } catch (error) {
      if (error instanceof InventarioNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      } else {
        return res.status(401).json({
          message:
            error instanceof Error
              ? error.message
              : "Error desconocido en el controlador de express aprobarSolicitudYGenerarMovimientos",
        });
      }
    }
  }
}
