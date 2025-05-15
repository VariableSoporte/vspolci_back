export class UsuarioCorreo {
    value: string;

    constructor (value: string){
        this.value = value;
        this.validarDato();
    }

    private validarDato (){
        const expresionRegular = /^[^\s@,"^;<>!#$&¿?\/()=\[\]*\\\x00-\x1F\x80-\xFF]+@[^\s@,"^;<>!#$&¿?\/()=\[\]*\\\x00-\x1F\x80-\xFF]+\.[^\s@,"^;<>!#$&¿?\/()=\[\]*\\\x00-\x1F\x80-\xFF]+$/;
        //console.log(this.value);
        if (!expresionRegular.test(this.value)){
            throw new Error (`El correo ${this.value} : no es una direccion valida`);
        }
    }
}