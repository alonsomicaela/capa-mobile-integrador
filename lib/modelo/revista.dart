import 'package:flutter/material.dart';
import 'package:integrador/modelo/item.dart';

class Revista extends Item {
  int _numeroSerie;
  DateTime _fechaDePublicacion;
  List<String> _notasPrincipales;

  Revista(unTitulo, unNumeroSerie, unaFechaPublicacion, unasNotas, unCodigo):
        _numeroSerie = unNumeroSerie,
        _fechaDePublicacion = unaFechaPublicacion,
        _notasPrincipales = unasNotas,
        super(unTitulo, unCodigo);

  @override
  Duration devolverEn() {
    var anioDePublicacion = _fechaDePublicacion.year;

    if(anioDePublicacion < 1980) {
      return const Duration(days: 2);
    } else if(1980 <= anioDePublicacion && anioDePublicacion < 2000) {
      return const Duration(days: 3);
    } else {
      return const Duration(days: 5);
    }
  }

  @override
  String descripcion() {
    return '${titulo()} - $_numeroSerie - ${_fechaDePublicacion.day}/${_fechaDePublicacion.month}/${_fechaDePublicacion.year}';
  }

  @override
  String info() {
    String notasInfo = '';

    for(String nota in _notasPrincipales) {
      notasInfo = '$notasInfo $nota';
    }

    return notasInfo;
  }

  @override
  Item copy() {
    return Revista(titulo(), _numeroSerie, _fechaDePublicacion, _notasPrincipales, codigoInterno());
  }
}