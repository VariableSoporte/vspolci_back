import { Insumo, InsumoId, InsumoKardex } from "./index";

export interface InsumoRepositorio {
    crear (insumo: Insumo): Promise<void>;
    editar (insumo:Insumo): Promise<void>;
    eliminar (id: InsumoId): Promise<void>;
    traerTodo (): Promise<Insumo[]>;
    traerPorId (id:InsumoId): Promise<Insumo | null>;
    traerPorBodega (id_bodega_per: number): Promise <InsumoKardex[]>;
    actualizarKardex(id_kardex:number,estante:string,fila:number):Promise<void>;
}