//import { RepositorioUsuarioMemoria } from "src/lib/usuario/infraestructura/repositorioUsuarioMemoria";
import { ReporteInsumos } from "reporte/dominio";
import { BodegaCrear, BodegaEditar, BodegaEliminar, BodegaTraerPorId, BodegaTraerTodo } from "../../bodega/aplicacion";
import { MySQLBodegaRepositorio } from "../../bodega/infraestructura/mysqlBodegaRepositorio";
import { InsumoActualizarKardex, InsumoCrear, InsumoEditar, InsumoEliminar, InsumoTraerPorBodega, InsumoTraerPorId, InsumoTraerTodo } from "../../insumo/aplicacion";
import { MySQLInsumoRepositorio } from "../../insumo/infraestructura/mysqlInsumoRepositorio";
import { InventarioAprobarSolicitudYGenerarMovimientos, InventarioConsultarEstados, InventarioConsultarPedidos, InventarioEnviarInventario, InventarioEnviarSolicitud, InventarioTraerTodo } from "../../inventario/aplicacion";
import { MySQLInventarioRepositorio } from "../../inventario/infraestructura/mysqlInventarioRepositorio";
import { UsuarioAutenticar, UsuarioCrear, UsuarioEditar, UsuarioEliminar, UsuarioTraerPorId, UsuarioTraerTodo } from "../../usuario/aplicacion";
import { MySQLUsuarioRepositorio } from "../../usuario/infraestructura/mysqlUsuarioRepositorio";
import { MySQLReporteRepositorio } from "../../reporte/infraestructura/mysqlReporteRepositorio";
import { ReporteReporteEntregas, ReporteReporteInsumos, ReporteReporteSalida, ReporteReporteSalidasBodegas } from "../../reporte/aplicacion";


const usuarioReporitorio = new MySQLUsuarioRepositorio();
const bodegaRepositorio = new MySQLBodegaRepositorio();
const insumoRepositorio = new MySQLInsumoRepositorio();
const inventarioRepositorio = new MySQLInventarioRepositorio();
const reporteRepositorio = new MySQLReporteRepositorio();
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
        eliminar: new InsumoEliminar(insumoRepositorio),
        traerPorBodega: new InsumoTraerPorBodega(insumoRepositorio),
        actualizarKArdex: new InsumoActualizarKardex(insumoRepositorio)
    },
    inventario : {
        traerTodo: new InventarioTraerTodo(inventarioRepositorio),
        enviarInventario: new InventarioEnviarInventario(inventarioRepositorio),
        enviarSolicitud: new InventarioEnviarSolicitud(inventarioRepositorio),
        consultarEstados: new InventarioConsultarEstados(inventarioRepositorio),
        consultarPedidos: new InventarioConsultarPedidos(inventarioRepositorio),
        aprobarSolicitudYGenerarMovimientos: new InventarioAprobarSolicitudYGenerarMovimientos(inventarioRepositorio)
    },
    reporte : {
        reporteInsumos: new ReporteReporteInsumos(reporteRepositorio),
        reporteSalida: new ReporteReporteSalida(reporteRepositorio),
        reporteSalidasBodegas: new ReporteReporteSalidasBodegas(reporteRepositorio),
        reporteEntregas: new ReporteReporteEntregas(reporteRepositorio)
    }
}
