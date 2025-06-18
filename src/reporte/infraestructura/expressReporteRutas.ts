import { Router } from "express";
import { verificarToken } from "../../compartir/auth/controlAutenticacion";
import { ExpressReporteControler } from "./expressReporteControler";

const controlador = new ExpressReporteControler();
const ExpressReporteRutas = Router();


ExpressReporteRutas.get("/reporte/", controlador.reporteInsumos);
ExpressReporteRutas.get("/reporte/salida", controlador.reporteSalidas);
ExpressReporteRutas.get("/reporte/salidasBodegas", controlador.reporteSalidasBodegas);
ExpressReporteRutas.post("/reporte/reporteEntregas", controlador.reporteEntregas);
/*ExpressInventarioRutas.get("/inventario/:id/", controlador.traerPorId);
ExpressInventarioRutas.post("/inventario/", controlador.crear);
ExpressInventarioRutas.put("/inventario/", controlador.editar);
ExpressInventarioRutas.delete("/inventario/:id/", controlador.eliminar); 
*/
export {ExpressReporteRutas}