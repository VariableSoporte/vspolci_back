import { Router } from "express";
import { verificarToken } from "../../compartir/auth/controlAutenticacion";
import { ExpressInventarioControler } from "./expressInventarioControler";

const controlador = new ExpressInventarioControler();
const ExpressInventarioRutas = Router();


ExpressInventarioRutas.get("/inventario/:id_bodega", controlador.traerTodo);
ExpressInventarioRutas.post("/inventario/enviar", controlador.enviarInventario);
ExpressInventarioRutas.post("/inventario/solicitud", controlador.enviarSolicitud);
ExpressInventarioRutas.get("/inventario/estados/:id_bodega", controlador.consultarEstados);
ExpressInventarioRutas.get("/inventario/pedidos/:id_bodega", controlador.consultarPedidos);
ExpressInventarioRutas.post("/inventario/aprobar_solicitud", controlador.aprobarSolicitudYGenerarMovimientos);
/*ExpressInventarioRutas.get("/inventario/:id/", controlador.traerPorId);
ExpressInventarioRutas.post("/inventario/", controlador.crear);
ExpressInventarioRutas.put("/inventario/", controlador.editar);
ExpressInventarioRutas.delete("/inventario/:id/", controlador.eliminar); 
*/
export {ExpressInventarioRutas}