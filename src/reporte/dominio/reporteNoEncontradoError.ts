export class ReporteNoEncontradoError extends Error {
constructor(message = "Reporte no encontrado") {
    super(message);
    this.name = "ReporteNoEncontradoError";
    Object.setPrototypeOf(this, ReporteNoEncontradoError.prototype); 
  }
}