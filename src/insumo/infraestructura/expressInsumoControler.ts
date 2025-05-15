import { NextFunction, Request, Response } from "express";
import { ServiciosContenedor } from "../../compartir/infraestructura/serviciosContenedor";
import { InsumoNoEncontradoError } from "../dominio";

export class ExpressInsumoControler {
  async traerTodo(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      const insumo = await ServiciosContenedor.insumo.traerTodo.handle();
      //console.log(usuarios);
      return res.json(insumo.map((u) => u.datoPrimitivo())).status(200);
    } catch (error) {
      if (error instanceof InsumoNoEncontradoError) {
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
      const insumo = await ServiciosContenedor.insumo.traerPorId.handle(id);
      return res.json(insumo.datoPrimitivo()).status(200);
    } catch (error) {
      if (error instanceof InsumoNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      }
      throw error;
    }
  }

  async crear(req: Request, res: Response, next: NextFunction): Promise<any> {
    try {
      const {
        id_insumo,
        nombre,
        descripcion,
        cantidad_paquete,
        nombre_medida,
        categoria,
        codigo,
        activo
      } = req.body as {
        id_insumo: number,
        nombre: string,
        descripcion: string,
        cantidad_paquete: number,
        nombre_medida: string,
        categoria: string,
        codigo: string,
        activo: number
      };
      await ServiciosContenedor.insumo.crear.handle(
        id_insumo,
        nombre,
        descripcion,
        cantidad_paquete,
        nombre_medida,
        categoria,
        codigo,
        activo
      );
      return res.status(201).json("Insumo creado exitosamente");
    } catch (error) {
      if (error instanceof InsumoNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      } else {
        return res.status(401).json({
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
        id_insumo,
        nombre,
        descripcion,
        cantidad_paquete,
        nombre_medida,
        categoria,
        codigo,
        activo
      } = req.body as {
        id_insumo: number,
        nombre: string,
        descripcion: string,
        cantidad_paquete: number,
        nombre_medida: string,
        categoria: string,
        codigo: string,
        activo: number
      };
      await ServiciosContenedor.insumo.editar.handle(
        id_insumo,
        nombre,
        descripcion,
        cantidad_paquete,
        nombre_medida,
        categoria,
        codigo,
        activo
      );
      return res.status(200).json("Insumo actualizado");
    } catch (error) {
      if (error instanceof InsumoNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      } else {
        return res.status(401).json({
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
    await ServiciosContenedor.insumo.eliminar.handle(id);
    return res.status(200).json("Insumo eliminado correctamente");

    } catch (error) {
      if (error instanceof InsumoNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      }else {
        return res.status(401).json({
          message:
            error instanceof Error
              ? error.message
              : "Error desconocido en el controlador de express eliminar",
        });
      }
    }
  }
}
