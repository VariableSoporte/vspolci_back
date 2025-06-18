import { ReporteNoEncontradoError, ReporteRepositorio } from "../../dominio";

export class ReporteReporteSalidasBodegas {
  constructor(private repositorio: ReporteRepositorio) {}

  async handle(): Promise<any[]> {
    const reporte = await this.repositorio.reporteSalidasBodegas();

    if (!reporte || reporte.length === 0) {
      throw new ReporteNoEncontradoError(
        `No se encontró reporte de bodegas `
      );
    }

    return reporte;
  }
}
