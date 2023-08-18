abstract class Item {
  String _titulo;
  int _cantidadPrestamos;
  bool _disponible;
  String _codigoInterno;

  Item(unTitulo, unCodigo):_titulo = unTitulo, _codigoInterno = unCodigo, _cantidadPrestamos = 0, _disponible = true;

  int prestamos() {
    return _cantidadPrestamos;
  }

  void prestar() {
    _disponible = false;
    _cantidadPrestamos += 1;
  }

  bool disponible() {
    return _disponible;
  }

  void devolver() {
    _disponible = true;
  }

  Duration devolverEn();

  String descripcion();

  String titulo() {
    return _titulo;
  }

  String info();

  String codigoInterno() {
    return _codigoInterno;
  }

  Item copy();
}