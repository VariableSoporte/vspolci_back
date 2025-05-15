export class UsuarioPermiso {
    value: number;

    constructor (value: number){
        this.value = value;
        this.validarDato();
    }

    private validarDato (){
        //console.log(this.value);
        if ( !(this.value === 1 || this.value === 0) ){
            throw new Error ("El usuario tiene permisos no validos");
        }
    }
}