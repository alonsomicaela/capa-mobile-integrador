import 'package:integrador/repositories/item_repository.dart';

import '../modelo/item.dart';
import '../modelo/prestamo.dart';

class PrestamoRepository {
  static Prestamo findPrestamoVigenteDe(Item item) {
    return allPrestamosVigentes().where((prestamo) => prestamo.item().codigoInterno() == item.codigoInterno()).first;
  }

  static List<Prestamo> allPrestamosVigentes() {
    List<Item> itemsPrestados = ItemRepository.itemsPrestados();
    List<Prestamo> prestamos = [];

    for (Item item in itemsPrestados) {
      prestamos.add(Prestamo(item, 'Ted Mosby'));
    }

    return prestamos;
  }

  static Prestamo crear(Item item, String persona) {
    return Prestamo(item, persona);
  }
}