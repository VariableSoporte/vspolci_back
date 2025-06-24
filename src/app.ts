import express, { ErrorRequestHandler, NextFunction, Request, Response } from "express";
import dotenv from "dotenv";
import cors from "cors";
import db from "./database/database";
import { ExpressUsuarioRutas } from "./usuario/infraestructura/expressUsuarioRutas";
import { ExpressBodegaRutas } from "./bodega/infraestructura/expressBodegaRutas";
import { ExpressInsumoRutas } from "./insumo/infraestructura/expressInsumoRutas";
import { ExpressInventarioRutas } from "./inventario/infraestructura/expressInventarioRutas";
import { ExpressReporteRutas } from "./reporte/infraestructura/expressReporteRutas";

dotenv.config();

const app = express();
const PORT = 443;
const morgan = require('morgan');
const helmet = require('helmet');

app.use(morgan('dev'));
app.use(helmet());

app.use( cors ({
  origin: process.env.CORS,
  credentials: true
}));

app.use(express.json());
app.use(ExpressUsuarioRutas);
app.use(ExpressBodegaRutas);
app.use(ExpressInsumoRutas);
app.use(ExpressInventarioRutas);
app.use(ExpressReporteRutas);


const errorHandler: ErrorRequestHandler = (err, req, res, next) => {
    console.error(err.message);
    res.status(500).json({ message: err instanceof Error ? err.message : 'Unknown error' });
  };
  
  // Usar el middleware de errores al final
  app.use(errorHandler);

app.listen(PORT,'0.0.0.0', () => {
  console.log(
    `Aplicacion de express esta corriendo en el puerto http://localhost:${PORT}`
  );
  console.log(
    `probando dotenv: ${process.env.DB_USER}`
  );
});
