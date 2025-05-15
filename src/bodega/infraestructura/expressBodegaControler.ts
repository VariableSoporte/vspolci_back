import { NextFunction, Request, Response } from "express";
import { ServiciosContenedor } from "../../compartir/infraestructura/serviciosContenedor";
import { BodegaNoEncontradaError } from "../dominio";

export class ExpressBodegaControler {
  async traerTodo(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      const bodegas = await ServiciosContenedor.bodega.traerTodo.handle();
      //console.log(usuarios);
      return res.json(bodegas.map((u) => u.datoPrimitivo())).status(200);
    } catch (error) {
      if (error instanceof BodegaNoEncontradaError) {
        return res.status(404).json({ message: error.message });
      }
      throw error;
    }
  }

  async traerPorId(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      //aqui podemos validar
      const id: number = parseInt(req.params.id);
      const bodega = await ServiciosContenedor.bodega.traerPorId.handle(id);
      return res.json(bodega.datoPrimitivo()).status(200);
    } catch (error) {
      if (error instanceof BodegaNoEncontradaError) {
        return res.status(404).json({ message: error.message });
      }
      throw error;
    }
  }

  async crear(req: Request, res: Response, next: NextFunction): Promise<any> {
    try {
      const {
        id_bodega,
        nombre,
        ciudad,
        zona
      } = req.body as {
        id_bodega: number;
        nombre: string;
        ciudad: string;
        zona: string;
      };
      await ServiciosContenedor.bodega.crear.handle(
        id_bodega,
        nombre,
        ciudad,
        zona
      );
      return res.status(201).json("Bodega creada exitosamente");
    } catch (error) {
      if (error instanceof BodegaNoEncontradaError) {
        return res.status(404).json({ message: error.message });
      } else {
        return res.status(500).json({
          message:
            error instanceof Error
              ? error.message
              : "Error desconocido en el controlador de express crear",
        });
      }
      throw error;
    }
  }

  async editar(req: Request, res: Response, next: NextFunction): Promise<any> {
    try {
      const {
        id_bodega,
        nombre,
        ciudad,
        zona
      } = req.body as {
        id_bodega:number,
        nombre:string,
        ciudad:string,
        zona:string
      };
      await ServiciosContenedor.bodega.editar.handle(
        id_bodega,
        nombre,
        ciudad,
        zona
      );
      return res.status(200).json("Bodega actualizada correctamente");
    } catch (error) {
      if (error instanceof BodegaNoEncontradaError) {
        return res.status(404).json({ message: error.message });
      } else {
        return res.status(500).json({
          message:
            error instanceof Error
              ? error.message
              : "Error desconocido en el controlador de express editar",
        });
      }
    }
  }

  async eliminar(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
    const id = parseInt(req.params.id);
    await ServiciosContenedor.bodega.eliminar.handle(id);
    return res.status(200).json("Bodega eliminada correctamente");

    } catch (error) {
      if (error instanceof BodegaNoEncontradaError) {
        return res.status(404).json({ message: error.message });
      }else {
        return res.status(500).json({
          message:
            error instanceof Error
              ? error.message
              : "Error desconocido en el controlador de express eliminar",
        });
      }
    }
  }
}
