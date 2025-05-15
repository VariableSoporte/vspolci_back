import { Usuario, UsuarioContrasenia, UsuarioCorreo, UsuarioId, UsuarioRepositorio } from "../dominio";

export class RepositorioUsuarioMemoria implements UsuarioRepositorio {
  private usuarios: Usuario[] = [];
  async crear(usuario: Usuario): Promise<void> {
    this.usuarios.push(usuario);
  }
  async traerTodo(): Promise<Usuario[]> {
    return this.usuarios;
  }
  async traerPorId(id: UsuarioId): Promise<Usuario | null> {
    return (
      this.usuarios.find((usuario) => usuario.id.value == id.value) || null
    );
  }
  async editar(usuario: Usuario): Promise<void> {
    const index = this.usuarios.findIndex(
      (u) => u.id.value == usuario.id.value
    );
    this.usuarios[index] = usuario;
  }
  async eliminar(id: UsuarioId): Promise<void> {
    this.usuarios = this.usuarios.filter(
      (usuario) => usuario.id.value !== id.value
    );
  }
  async autenticar(correo: UsuarioCorreo, contrasenia: UsuarioContrasenia): Promise<Usuario | null> {
    return null;
  }
}
