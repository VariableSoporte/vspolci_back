export class InventarioNoEncontradoError extends Error {
constructor(message = "Inventario no encontrado") {
    super(message);
    this.name = "InventarioNoEncontradoError";
    Object.setPrototypeOf(this, InventarioNoEncontradoError.prototype); 
  }
}