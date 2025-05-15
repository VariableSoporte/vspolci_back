//import { RepositorioUsuarioMemoria } from "src/lib/usuario/infraestructura/repositorioUsuarioMemoria";
import { MySQLUsuarioRepositorio } from "../../usuario/infraestructura/mysqlUsuarioRepositorio";
import { UsuarioCrear, UsuarioEditar, UsuarioEliminar, UsuarioTraerPorId, UsuarioTraerTodo, UsuarioAutenticar } from "../../usuario/aplicacion";
import { BodegaTraerTodo, BodegaTraerPorId, BodegaCrear, BodegaEditar, BodegaEliminar } from "../../bodega/aplicacion";
import { MySQLBodegaRepositorio } from "../../bodega/infraestructura/mysqlBodegaRepositorio";
import { MySQLInsumoRepositorio } from "../../insumo/infraestructura/mysqlInsumoRepositorio";
import { InsumoCrear, InsumoEditar, InsumoEliminar, InsumoTraerPorId, InsumoTraerTodo } from "../../insumo/aplicacion";


//const usuarioReporitorio = new MySQLUsuarioRepositorio();
const usuarioReporitorio = new MySQLUsuarioRepositorio();
const bodegaRepositorio = new MySQLBodegaRepositorio();
const insumoRepositorio = new MySQLInsumoRepositorio();
//const usuarioReporitorio = new RepositorioUsuarioMemoria();

export const ServiciosContenedor = {
    usuario: {
        traerTodo: new UsuarioTraerTodo(usuarioReporitorio),
        traerPorId: new UsuarioTraerPorId(usuarioReporitorio),
        crear: new UsuarioCrear(usuarioReporitorio),
        editar: new UsuarioEditar(usuarioReporitorio),
        eliminar: new UsuarioEliminar(usuarioReporitorio),
        autenticarUsuario: new UsuarioAutenticar(usuarioReporitorio)
    },
    bodega: {
        traerTodo: new BodegaTraerTodo(bodegaRepositorio),
        traerPorId: new BodegaTraerPorId(bodegaRepositorio),
        crear: new BodegaCrear(bodegaRepositorio),
        editar: new BodegaEditar(bodegaRepositorio),
        eliminar: new BodegaEliminar(bodegaRepositorio)
    },
    insumo: {
        traerTodo: new InsumoTraerTodo(insumoRepositorio),
        traerPorId: new InsumoTraerPorId(insumoRepositorio),
        crear: new InsumoCrear(insumoRepositorio),
        editar: new InsumoEditar(insumoRepositorio),
        eliminar: new InsumoEliminar(insumoRepositorio)
    }
}
