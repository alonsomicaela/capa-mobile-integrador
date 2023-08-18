import 'package:integrador/modelo/item.dart';

class Prestamo {
  Item _item;
  String _persona;
  DateTime _fechaInicio;
  DateTime _fechaFin;

  Prestamo(unItem, unaPersona):
        _item = unItem,
        _persona = unaPersona,
        _fechaInicio = DateTime.now(),
        _fechaFin = DateTime.now().add(unItem.devolverEn());


  String persona() {
    return _persona;
  }

  Item item() {
    return _item;
  }

  DateTime fechaInicio() {
    return _fechaInicio;
  }

  DateTime fechaFin() {
    return _fechaFin;
  }
}