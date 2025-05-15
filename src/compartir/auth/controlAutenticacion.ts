// src/auth/authController.ts
import { NextFunction, Request, Response } from "express";
import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import { ServiciosContenedor } from "../../compartir/infraestructura/serviciosContenedor";
import { UsuarioNoEncontradoError } from "../../usuario/dominio";


export class ControlAutenticacion {
  static async login(req: Request, res: Response): Promise<any> {
    const JWT_SECRET = process.env.JWT_SECRET || "secreto";
    const { correo, contrasenia } = req.body as { correo: string, contrasenia: string};

    try {
      const usuarioAntes = await ServiciosContenedor.usuario.autenticarUsuario.handle(correo, contrasenia);

      if (!usuarioAntes) {
        return res.status(401).json({ message: "Correo o contraseña incorrectos" });
      }

      // Comparar la contraseña cifrada
      /*
      const passwordIsValid = await bcrypt.compare(contrasenia, usuario.contrasenia);

      if (!passwordIsValid) {
        return res.status(401).json({ message: "Correo o contraseña incorrectos" });
      }
      */
      // Crear el token JWT
      const token = jwt.sign({ id_usuario: usuarioAntes.id.value }, JWT_SECRET, {
        expiresIn: "1h",
      });
      const usuario = usuarioAntes.datoPrimitivo();

      return res.status(200).json({ token, usuario });
    } catch (error) {
        if (error instanceof UsuarioNoEncontradoError) {
            return res.status(404).json({ message: error.message });
          } else {
            return res.status(401).json({
              message:
                error instanceof Error
                  ? error.message
                  : "Error desconocido en el control autenticaciones",
            });
          }
    }
  }
}

export const verificarToken = (req: Request, res: Response, next: NextFunction) => {
  const JWT_SECRET = process.env.JWT_SECRET || "mySecretKey123";
  const token = req.headers["authorization"]?.split(" ")[1];

  if (!token) {
    res.status(403).json({ message: "Token no proporcionado" });
    return;
  }

  try {
    const decoded = jwt.verify(token, JWT_SECRET) as { id_usuario: number };
    req.body.userId = decoded.id_usuario;
    next();
  } catch (error) {
    res.status(401).json({ message: "Token inválido" });
  }
};