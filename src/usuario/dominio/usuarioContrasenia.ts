export class UsuarioContrasenia {
    value: string;

    constructor (value: string){
        this.value = value;
        this.validarDato();
    }

    private validarDato (){
        if ( !(this.value.length >= 8) ){
            throw new Error ("La contraseña no tiene la longitud adecuada");
        }
    }
}