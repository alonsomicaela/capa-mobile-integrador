import 'package:integrador/modelo/item.dart';

class Pelicula extends Item {
  Duration _duracionEnMinutos;
  List<String> _actoresPrincipales;

  Pelicula(unTitulo, unaDuracionEnMinutos, unosActores, unCodigo):
        _duracionEnMinutos = unaDuracionEnMinutos,
        _actoresPrincipales = unosActores,
        super(unTitulo, unCodigo);

  @override
  Duration devolverEn() {
    return _duracionEnMinutos < const Duration(minutes: 120) ? const Duration(days: 3) : const Duration(days: 5);
  }

  @override
  String descripcion() {
    var horas = _duracionEnMinutos.inHours;
    var minutos = _duracionEnMinutos.inMinutes.remainder(60);

    return '${titulo()} - $horas.${minutos}hs';
  }

  @override
  String info() {
    String actoresInfo = '';

    for(String actor in _actoresPrincipales) {
      actoresInfo = '$actoresInfo $actor';
    }

    return actoresInfo;
  }

  @override
  Item copy() {
    return Pelicula(titulo(), _duracionEnMinutos, _actoresPrincipales, codigoInterno());
  }
}