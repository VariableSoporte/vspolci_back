import { Insumo, InsumoActivo, InsumoCantidad, InsumoCategoria, InsumoCodigo, InsumoDescripcion, InsumoId, InsumoMedida, InsumoNombre, InsumoRepositorio } from "../../dominio";

export class InsumoEditar {
  constructor(private repositorio: InsumoRepositorio) {}

  async handle(
    id: number,
    nombre: string,
    descripcion: string,
    cantidad: number,
    medida: string,
    categoria: string,
    codigo: string,
    activo: number
  ): Promise<void> {
    const insumo = new Insumo(
      new InsumoId(id),
      new InsumoNombre(nombre),
      new InsumoDescripcion(descripcion),
      new InsumoCantidad(cantidad),
      new InsumoMedida(medida),
      new InsumoCategoria(categoria),
      new InsumoCodigo(codigo),
      new InsumoActivo(activo)
    );
    return await this.repositorio.editar(insumo);
  }
}
