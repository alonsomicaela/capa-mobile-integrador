import 'package:flutter_test/flutter_test.dart';
import 'package:integrador/modelo/libro.dart';
import 'package:integrador/modelo/prestamo.dart';

void main() {
  test('un nuevo prestamo tiene un ítem, una persona que lo reservo, una fecha de prestamo y una de fin según el ítem', () {
    var item = Libro('The Bro Code', 'Barney Stinson', 536, 'Barney nos cuentas las reglas para ser un buen Bro', 'codigo');
    var persona = 'Ted Mosby';
    var prestamo = Prestamo(item, persona);


    var hoy = DateTime.now();
    var pasadoManiana = hoy.add(const Duration(days: 6));

    expect(prestamo.persona(), equals(persona));
    expect(prestamo.item(), equals(item));
    expect(prestamo.fechaInicio().day, equals(hoy.day));
    expect(prestamo.fechaInicio().month, equals(hoy.month));
    expect(prestamo.fechaInicio().year, equals(hoy.year));
    expect(prestamo.fechaFin().day, equals(pasadoManiana.day));
  });
}