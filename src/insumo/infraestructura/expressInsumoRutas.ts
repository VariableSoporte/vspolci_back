import { Router } from "express";
import { verificarToken } from "../../compartir/auth/controlAutenticacion";
import { ExpressInsumoControler } from "./expressInsumoControler";

const controlador = new ExpressInsumoControler();
const ExpressInsumoRutas = Router();


ExpressInsumoRutas.get("/insumo/", controlador.traerTodo);
ExpressInsumoRutas.get("/insumo/:id/", controlador.traerPorId);
ExpressInsumoRutas.post("/insumo/", controlador.crear);
ExpressInsumoRutas.put("/insumo/", controlador.editar);
ExpressInsumoRutas.delete("/insumo/:id/", controlador.eliminar); 
ExpressInsumoRutas.get("/insumo/porBodega/:id_bodega_per", controlador.traerPorBodega); 
ExpressInsumoRutas.post("/insumo/kardex/", controlador.actualizarKardex); 

export {ExpressInsumoRutas}