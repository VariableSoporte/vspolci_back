import { Router } from "express";
import { ExpressUserControler } from "./expressUserControler";
import { ControlAutenticacion, verificarToken } from "../../compartir/auth/controlAutenticacion";

const controlador = new ExpressUserControler();
const ExpressUsuarioRutas = Router();


ExpressUsuarioRutas.post("/login/",ControlAutenticacion.login)

//ExpressUsuarioRutas.get("/usuario/", controlador.traerTodo, verificarToken);
ExpressUsuarioRutas.get("/usuario/", controlador.traerTodo);
ExpressUsuarioRutas.get("/usuario/:id/", controlador.traerPorId);
ExpressUsuarioRutas.post("/usuario/", controlador.crear);
ExpressUsuarioRutas.put("/usuario/", controlador.editar);
ExpressUsuarioRutas.delete("/usuario/:id/", controlador.eliminar); 

export {ExpressUsuarioRutas}