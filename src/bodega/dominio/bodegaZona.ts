export class BodegaZona {
    value: string;

    constructor (value: string){
        this.value = value;
        this.validarDato();
    }

    private validarDato (){
        const expresionRegular = /^[A-Za-zÁÉÍÓÚáéíóúñÑüÜ0-9 -]+$/;    

        if (!expresionRegular.test(this.value) && !/\s{2,}/.test(this.value) && !/^\s|\s$/.test(this.value)){
            throw new Error ("La zona de la bodega tiene caracteres no validos");
        }
    }
}