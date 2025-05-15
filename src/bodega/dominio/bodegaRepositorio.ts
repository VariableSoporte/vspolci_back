import { Bodega, BodegaId } from ".";

export interface BodegaRepositorio {
    crear (usuario: Bodega): Promise<void>;
    traerTodo (): Promise<Bodega[]>;
    traerPorId (id: BodegaId): Promise<Bodega | null>;
    editar (bodega: Bodega): Promise<void>;
    eliminar (id: BodegaId): Promise<void>;
}

