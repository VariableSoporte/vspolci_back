import express, { ErrorRequestHandler, NextFunction, Request, Response } from "express";
import dotenv from "dotenv";
import cors from "cors";
import db from "./database/database";
import { ExpressUsuarioRutas } from "./usuario/infraestructura/expressUsuarioRutas";
import { ExpressBodegaRutas } from "./bodega/infraestructura/expressBodegaRutas";
import { ExpressInsumoRutas } from "./insumo/infraestructura/expressInsumoRutas";

dotenv.config();

const app = express();
const PORT = 3000;
const morgan = require('morgan');
const helmet = require('helmet');

app.use(morgan('dev'));
app.use(helmet());

app.use( cors ({
  origin: "http://localhost:5173",
  credentials: true
}));

app.use(express.json());
app.use(ExpressUsuarioRutas);
app.use(ExpressBodegaRutas);
app.use(ExpressInsumoRutas);


const errorHandler: ErrorRequestHandler = (err, req, res, next) => {
    console.error(err.message);
    res.status(500).json({ message: err instanceof Error ? err.message : 'Unknown error' });
  };
  
  // Usar el middleware de errores al final
  app.use(errorHandler);

app.listen(PORT, () => {
  console.log(
    `Aplicacion de express esta corriendo en el puerto http://localhost:${PORT}`
  );
  console.log(
    `probando dotenv: ${process.env.DB_USER}`
  );
});
