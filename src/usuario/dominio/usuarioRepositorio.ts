import {Usuario, UsuarioContrasenia, UsuarioCorreo, UsuarioId} from "./index";

export interface UsuarioRepositorio {
    crear (usuario: Usuario): Promise<void>;
    traerTodo (): Promise<Usuario[]>;
    traerPorId (id: UsuarioId): Promise<Usuario | null>;
    editar (usuario: Usuario): Promise<void>;
    eliminar (id: UsuarioId): Promise<void>;
    autenticar (correo: UsuarioCorreo, contrasenia: UsuarioContrasenia): Promise<Usuario | null>;
}

