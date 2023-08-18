import 'package:integrador/modelo/item.dart';

class Libro extends Item {
  String _autor;
  int _cantidadPagina;
  String _resumenTrama;

  Libro(unTitulo, unAutor, unaCantidadPaginas, unResumenDeTrama, unCodigo):
        _autor = unAutor,
        _cantidadPagina = unaCantidadPaginas,
        _resumenTrama = unResumenDeTrama,
        super(unTitulo, unCodigo);

  @override
  Duration devolverEn() {
    var dias = (_cantidadPagina/100).ceil();
    return Duration(days: dias);
  }

  @override
  String descripcion() {
    return '${titulo()} - $_autor';
  }

  @override
  String info() {
    return _resumenTrama;
  }

  @override
  Item copy() {
    return Libro(titulo(), _autor, _cantidadPagina, _resumenTrama, codigoInterno());
  }
}