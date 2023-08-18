import 'modelo/item.dart';

class FechaHelper {
  static fechaToString(DateTime fecha) {
    return '${fecha.day}/${fecha.month}/${fecha.year}';
  }

  static fechaDevolucionParaItemDisponible(Item item) {
    return DateTime.now().add(item.devolverEn());
  }
}