export class Inventario {
  id_kardex: number;
  nombre: string;
  descripcion: string;
  cantidad: number;
  cantidad_paquete: number;
  nombre_medida: string;
  categoria: string;
  codigo: string;
  estante: string;
  fila: number;
  id_producto_per: number;

  constructor(
    id_kardex: number,
    nombre: string,
    descripcion: string,
    cantidad: number,
    cantidad_paquete: number,
    nombre_medida: string,
    categoria: string,
    codigo: string,
    estante: string,
    fila: number,
    id_producto_per: number
  ) {
    (this.id_kardex = id_kardex),
    (this.nombre = nombre),
    (this.descripcion = descripcion),
    (this.cantidad = cantidad),
    (this.cantidad_paquete = cantidad_paquete),
    (this.nombre_medida = nombre_medida),
    (this.categoria = categoria),
    (this.codigo = codigo),
    (this.estante = estante),
    (this.fila = fila);
    (this.id_producto_per = id_producto_per);
  };
  public datoPrimitivo() {
    return {
      id_kardex: this.id_kardex,
      nombre: this.nombre,
      descripcion: this.descripcion,
      cantidad: this.cantidad,
      cantidad_paquete: this.cantidad_paquete,
      nombre_medida: this.nombre_medida,
      categoria: this.categoria,
      codigo: this.codigo,
      estante: this.estante,
      fila: this.fila,
      id_producto_per: this.id_producto_per,
    };
  };
};

export class InventarioEnviar {
  id_kardex_per: number;
  numero_informe: string;
  cantidad: number;
  fecha_salida: string;
  id_entrada_per;
  nombre_solicitante: string;
  area: string;
  disposicion_entrega: string;

  constructor(
    id_kardex_per: number,
    numero_informe: string,
    cantidad: number,
    fecha_salida: string,
    id_entrada_per: string,
    nombre_solicitante: string,
    area: string,
    disposicion_entrega: string
  ){
    (this.id_kardex_per = id_kardex_per),
    (this.numero_informe = numero_informe),
    (this.cantidad = cantidad),
    (this.fecha_salida = fecha_salida),
    (this.id_entrada_per = id_entrada_per),
    (this.nombre_solicitante = nombre_solicitante),
    (this.area = area),
    (this.disposicion_entrega = disposicion_entrega);
  };
  public datoPrimitivo () {
    return {
      id_kardex_per : this.id_kardex_per,
      numero_informe : this.numero_informe,
      cantidad : this.cantidad,
      fecha_salida : this.fecha_salida,
      id_entrada_per : this.id_entrada_per,
      nombre_solicitante : this.nombre_solicitante,
      area : this.area,
      disposicion_entrega : this.disposicion_entrega,
    };
  };
};

export type dato = {
  id_producto_per: number;
  nombre_producto: string;
  cantidad: number;
  motivo: string;
  detalle_solicitud: string;
  cantidad_enviada: number;
};

export class InventarioSolicitud {
  id_bodega_per : number;
  id_bodega_sol : number;
  fecha_emision : string;
  fecha_aprovado : string;
  aprovado : number;
  id_usuario_sol : number;
  id_usuario_aprueba : number;
  pedido : dato[];
  constructor(
    id_bodega_per : number,
    id_bodega_sol : number,
    fecha_emision : string,
    fecha_aprovado : string,
    aprovado : number,
    id_usuario_sol : number,
    id_usuario_aprueba : number,
    pedido : dato[],
  ){
    (this.id_bodega_per = id_bodega_per),
    (this.id_bodega_sol = id_bodega_sol),
    (this.fecha_emision = fecha_emision),
    (this.fecha_aprovado = fecha_aprovado),
    (this.aprovado = aprovado),
    (this.id_usuario_sol = id_usuario_sol),
    (this.id_usuario_aprueba = id_usuario_aprueba),
    (this.pedido = pedido)
  }
  public datoPrimitivo () {
    return {
      id_bodega_per : this.id_bodega_per,
      id_bodega_sol : this.id_bodega_sol,
      fecha_emision : this.fecha_emision,
      fecha_aprovado : this.fecha_aprovado,
      aprovado : this.aprovado,
      id_usuario_sol : this.id_usuario_sol,
      id_usuario_aprueba : this.id_usuario_aprueba,
      pedido : this.pedido,
    };
  };
};

export type ListaPedido = {
  id_producto_per: number;
  nombre: string;
  cantidad: number;
  cantidad_enviada: number;
  id_kardex?: number;
};

export class EstadosPedidos {
  id_solicitud: number;
  nombre_bodega: string;
  fecha_emision: string;
  fecha_aprobado: string;
  usuario_solicitante: string;
  usuario_aprobador: string;
  productos: ListaPedido[];
  constructor(
    id_solicitud:number,
    nombre_bodega:string,
    fecha_emision:string,
    fecha_aprobado:string,
    usuario_solicitante:string,
    usuario_aprobador:string,
    productos:ListaPedido[]
  ){
    (this.id_solicitud = id_solicitud),
    (this.nombre_bodega = nombre_bodega),
    (this.fecha_emision = fecha_emision),
    (this.fecha_aprobado = fecha_aprobado),
    (this.usuario_solicitante = usuario_solicitante),
    (this.usuario_aprobador = usuario_aprobador),
    (this.productos = productos)
  }
  public datoPrimitivo () {
    return {
      id_solicitud : this.id_solicitud,
      nombre_bodega : this.nombre_bodega,
      fecha_emision : this.fecha_emision,
      fecha_aprobado : this.fecha_aprobado,
      usuario_solicitante : this.usuario_solicitante,
      usuario_aprobador : this.usuario_aprobador,
      productos : this.productos
    };
  };
};