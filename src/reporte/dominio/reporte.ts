export class ReporteInsumos {
    id_producto : number;
    nombre: string;
    descripcion : string;
    cantidad_paquete: number;
    activo : number;
    total : number;
    constructor (
        id_producto: number,
        nombre: string,
        descripcion : string,
        cantidad_paquete : number,
        activo : number,
        total : number,
    ){
        (this.id_producto = id_producto),
        (this.nombre = nombre),
        (this.descripcion = descripcion),
        (this.cantidad_paquete = cantidad_paquete),
        (this.activo = activo),
        (this.total = total)
    }
    public datoPrimitivo (){
        return {
            id_producto : this.id_producto,
            nombre : this.nombre,
            descripcion : this.descripcion,
            cantidad_paquete : this.cantidad_paquete,
            activo : this.activo,
            total : this.total,
        }
    }
}