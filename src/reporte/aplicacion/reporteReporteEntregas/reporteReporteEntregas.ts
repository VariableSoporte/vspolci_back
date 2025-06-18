import { ReporteInsumos, ReporteNoEncontradoError, ReporteRepositorio } from "../../dominio";

export class ReporteReporteEntregas {
  constructor(private repositorio: ReporteRepositorio) {}

  async handle(id_bodega: number): Promise<ReporteInsumos[]> {
    const reporte = await this.repositorio.reporteEntregas(id_bodega);

    if (!reporte || reporte.length === 0) {
      throw new ReporteNoEncontradoError(
        `No se encontró reporte de bodegas entregas `
      );
    }

    return reporte;
  }
}
