import { ReporteInsumos } from "./reporte";

export interface ReporteRepositorio {
  reporteInsumos(): Promise<ReporteInsumos[]>;
  reporteSalidas(): Promise<any[]>;
  reporteSalidasBodegas(): Promise<any[]>;
  reporteEntregas(id_bodega: number): Promise<any[]>;
}
