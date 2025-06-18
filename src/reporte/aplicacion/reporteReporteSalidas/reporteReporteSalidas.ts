import { ReporteNoEncontradoError, ReporteRepositorio } from "../../dominio";

export class ReporteReporteSalida {
  constructor(private repositorio: ReporteRepositorio) {}

  async handle(): Promise<any[]> {
    const reporte = await this.repositorio.reporteSalidas();

    if (!reporte || reporte.length === 0) {
      throw new ReporteNoEncontradoError(
        `No se encontró reporte de insumos `
      );
    }

    return reporte;
  }
}
