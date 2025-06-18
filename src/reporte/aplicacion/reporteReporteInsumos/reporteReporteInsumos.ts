import { ReporteInsumos, ReporteNoEncontradoError, ReporteRepositorio } from "../../dominio";

export class ReporteReporteInsumos {
  constructor(private repositorio: ReporteRepositorio) {}

  async handle(): Promise<ReporteInsumos[]> {
    const reporte = await this.repositorio.reporteInsumos();

    if (!reporte || reporte.length === 0) {
      throw new ReporteNoEncontradoError(
        `No se encontró reporte de insumos `
      );
    }

    return reporte;
  }
}
