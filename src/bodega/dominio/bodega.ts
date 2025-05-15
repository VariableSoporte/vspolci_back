import { BodegaCiudad, BodegaId, BodegaNombre, BodegaZona } from "./index";

export class Bodega {
  id: BodegaId;
  nombre: BodegaNombre;
  ciudad: BodegaCiudad;
  zona: BodegaZona;

  constructor(
    id: BodegaId,
    nombre: BodegaNombre,
    ciudad: BodegaCiudad,
    zona: BodegaZona
  ) {
    this.id = id;
    this.nombre = nombre;
    this.ciudad = ciudad;
    this.zona = zona;
  }

  public datoPrimitivo() {
    return {
      id: this.id.value,
      nombre: this.nombre.value,
      ciudad: this.ciudad.value,
      zona: this.zona.value,
    };
  }
}
