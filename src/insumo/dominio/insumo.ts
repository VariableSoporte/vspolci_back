import {
  InsumoActivo,
  InsumoCantidad,
  InsumoCategoria,
  InsumoCodigo,
  InsumoDescripcion,
  InsumoId,
  InsumoMedida,
  InsumoNombre,
} from "./index";

export class Insumo {
  id: InsumoId;
  nombre: InsumoNombre;
  descripcion: InsumoDescripcion;
  cantidad_paquete: InsumoCantidad;
  medida: InsumoMedida;
  categoria: InsumoCategoria;
  codigo: InsumoCodigo;
  activo: InsumoActivo;

  constructor(
    id: InsumoId,
    nombre: InsumoNombre,
    descripcion: InsumoDescripcion,
    cantidad_paquete: InsumoCantidad,
    medida: InsumoMedida,
    categorida: InsumoCategoria,
    codigo: InsumoCodigo,
    activo: InsumoActivo
  ) {
    this.id = id;
    this.nombre = nombre;
    this.descripcion = descripcion;
    this.cantidad_paquete = cantidad_paquete;
    this.medida = medida;
    this.categoria = categorida;
    this.codigo = codigo;
    this.activo = activo;
  }

  public datoPrimitivo() {
    return {
      id: this.id.value,
      nombre: this.nombre.value,
      descripcion: this.descripcion.value,
      cantidad_paquete: this.cantidad_paquete.value,
      medida: this.medida.value,
      categoria: this.categoria.value,
      codigo: this.codigo.value,
      activo: this.activo.value,
    };
  }
}

export class InsumoKardex {
  id_kardex: number;
  id_producto_per: number;
  nombre: string;
  descripcion: string;
  categoria: string;
  cantidad: number;
  estante: string;
  fila: number;
  constructor(
    id_kardex: number,
    id_producto_per: number,
    nombre: string,
    descripcion: string,
    categoria: string,
    cantidad: number,
    estante: string,
    fila: number
  ){
    this.id_kardex = id_kardex;
    this.id_producto_per = id_producto_per;
    this.nombre = nombre;
    this.descripcion = descripcion;
    this.categoria = categoria;
    this.cantidad = cantidad;
    this.estante = estante;
    this.fila = fila;
  }
  public datoPrimitivo (){
    return {
      id_kardex : this.id_kardex,
      id_producto_per : this.id_producto_per,
      nombre : this.nombre,
      descripcion : this.descripcion,
      categoria : this.categoria,
      cantidad : this.cantidad,
      estante : this.estante,
      fila : this.fila,
    }
  }
}
