export class BodegaNombre {
    value: string;

    constructor (value: string){
        this.value = value;
        this.validarDato();
    }

    private validarDato (){
        const expresionRegular = /^[A-Za-zÁÉÍÓÚáéíóúñÑüÜ -]+$/;    

        if (!expresionRegular.test(this.value) && !/\s{2,}/.test(this.value) && !/^\s|\s$/.test(this.value)){
            throw new Error ("El nombre de bodega tiene caracteres no validos");
        }
    }
}