import { Insumo, InsumoId } from "./index";

export interface InsumoRepositorio {
    crear (insumo: Insumo): Promise<void>;
    editar (insumo:Insumo): Promise<void>;
    eliminar (id: InsumoId): Promise<void>;
    traerTodo (): Promise<Insumo[]>;
    traerPorId (id:InsumoId): Promise<Insumo | null>;
}