import { NextFunction, Request, Response } from "express";
import { ServiciosContenedor } from "../../compartir/infraestructura/serviciosContenedor";
import { UsuarioNoEncontradoError } from "../dominio";

export class ExpressUserControler {
  async traerTodo(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      const usuarios = await ServiciosContenedor.usuario.traerTodo.run();
      return res.json(usuarios.map((u) => u.datoPrimitivo())).status(200);
    } catch (error) { 
      if (error instanceof UsuarioNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      }
      throw error;
    }
  }

  async traerPorId(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
      //aqui podemos validar
      const id: number = parseInt(req.params.id);
      const user = await ServiciosContenedor.usuario.traerPorId.handle(id);
      return res.json(user.datoPrimitivo()).status(200);
    } catch (error) {
      if (error instanceof UsuarioNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      }
      throw error;
    }
  }

  async crear(req: Request, res: Response, next: NextFunction): Promise<any> {
    try {
      const {
        id_usuario,
        nombres,
        apellidos,
        correo,
        contrasenia,
        activo,
        id_bodega_per,
        permisos,
      } = req.body as {
        id_usuario: number;
        nombres: string;
        apellidos: string;
        correo: string;
        contrasenia: string;
        activo: number;
        id_bodega_per: number[];
        permisos: number;
      };
      await ServiciosContenedor.usuario.crear.handle(
        id_usuario,
        nombres,
        apellidos,
        correo,
        contrasenia,
        activo,
        id_bodega_per,
        permisos
      );
      return res.status(201).json("Usuario creado exitosamente");
    } catch (error) {
      if (error instanceof UsuarioNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      } else {
        return res.status(500).json({
          message:
            error instanceof Error
              ? error.message
              : "Error desconocido en el controlador de express crear",
        });
      }
      throw error;
    }
  }

  async editar(req: Request, res: Response, next: NextFunction): Promise<any> {
    try {
      const {
        id_usuario,
        nombres,
        apellidos,
        correo,
        contrasenia,
        activo,
        id_bodega_per,
        permisos,
      } = req.body as {
        id_usuario: number;
        nombres: string;
        apellidos: string;
        correo: string;
        contrasenia: string;
        activo: number;
        id_bodega_per: number[];
        permisos: number;
      };
      await ServiciosContenedor.usuario.editar.handle(
        id_usuario,
        nombres,
        apellidos,
        correo,
        contrasenia,
        activo,
        id_bodega_per,
        permisos
      );
      return res.status(200).json("Usuario actualizado correctamente");
    } catch (error) {
      if (error instanceof UsuarioNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      } else {
        return res.status(500).json({
          message:
            error instanceof Error
              ? error.message
              : "Error desconocido en el controlador de express editar",
        });
      }
    }
  }

  async eliminar(
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<any> {
    try {
    const id = parseInt(req.params.id);
    await ServiciosContenedor.usuario.eliminar.handle(id);
    return res.status(200).json("Usuario eliminado correctamente");

    } catch (error) {
      if (error instanceof UsuarioNoEncontradoError) {
        return res.status(404).json({ message: error.message });
      }else {
        return res.status(500).json({
          message:
            error instanceof Error
              ? error.message
              : "Error desconocido en el controlador de express eliminar",
        });
      }
    }
  }
}
