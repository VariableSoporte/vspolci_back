import { NextFunction, Request, Response } from "express";
import { ServiciosContenedor } from "../../compartir/infraestructura/serviciosContenedor";
import { ReporteNoEncontradoError } from "../dominio";

export class ExpressReporteControler {
  async reporteInsumos(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      const reporte = await ServiciosContenedor.reporte.reporteInsumos.handle();
      return res.json(reporte.map((u) => u.datoPrimitivo())).status(200);
    } catch (error) {
      if (error instanceof ReporteNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      }
      throw error;
    }
  }
  async reporteSalidas(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      const reporte = await ServiciosContenedor.reporte.reporteSalida.handle();
      return res.json(reporte.map((u) => u)).status(200);
    } catch (error) {
      if (error instanceof ReporteNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      }
      throw error;
    }
  }
  async reporteSalidasBodegas(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      const reporte =
        await ServiciosContenedor.reporte.reporteSalidasBodegas.handle();
      return res.json(reporte.map((u) => u)).status(200);
    } catch (error) {
      if (error instanceof ReporteNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      }
      throw error;
    }
  }
  async reporteEntregas(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      const id_bodega: number = parseInt(req.body.id_bodega);
      const reporte = await ServiciosContenedor.reporte.reporteEntregas.handle(id_bodega);
      return res.json(reporte.map((u) => u)).status(200);
    } catch (error) {
      if (error instanceof ReporteNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      }
      throw error;
    }
  }
 
}
