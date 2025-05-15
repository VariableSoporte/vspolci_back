import { Router } from "express";
import { ExpressBodegaControler } from "./expressBodegaControler";
import { verificarToken } from "../../compartir/auth/controlAutenticacion";

const controlador = new ExpressBodegaControler();
const ExpressBodegaRutas = Router();

//ExpressBodegaRutas.get("/bodega/", verificarToken, controlador.traerTodo);
ExpressBodegaRutas.get("/bodega/", controlador.traerTodo);
ExpressBodegaRutas.get("/bodega/:id/", controlador.traerPorId);
ExpressBodegaRutas.post("/bodega/", controlador.crear);
ExpressBodegaRutas.put("/bodega/", controlador.editar);
ExpressBodegaRutas.delete("/bodega/:id/", controlador.eliminar); 

export {ExpressBodegaRutas}