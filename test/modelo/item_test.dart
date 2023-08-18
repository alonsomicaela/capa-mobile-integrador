import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:integrador/modelo/libro.dart';
import 'package:integrador/modelo/pelicula.dart';
import 'package:integrador/modelo/revista.dart';

void main() {
  group('reservar', () {
    test('un ítem nuevo no tiene ninguna reserva y se encuentra disponible', () {
      var item = Libro('The Bro Code', 'Barney Stinson', 536, 'Un resumen', 'codigo');

      expect(item.prestamos(), equals(0));
      expect(item.disponible(), equals(true));
    });

    test('un item puede ser reservado, aumentando su cantidad de reservas', () {
      var item = Libro('The Bro Code', 'Barney Stinson', 536, 'Un resumen', 'codigo');

      item.prestar();

      expect(item.prestamos(), equals(1));
      expect(item.disponible(), equals(false));
    });
  });

  group('devolución', () {
    test ('un ítem reservado puede ser devuelto y volver a estar disponible', () {
      var item = Libro('The Bro Code', 'Barney Stinson', 536, 'Un resumen', 'codigo');
      item.prestar();

      item.devolver();

      expect(item.disponible(), equals(true));
    });
  });

  group('tiempo de devolución', () {
    test('un ítem libro debe ser devuelto según la cantidad de páginas donde 100 pags son un día, redondeando para arriba', () {
      var libro = Libro('The Bro Code', 'Barney Stinson', 536, 'Un resumen', 'codigo');

      expect(libro.devolverEn(), equals(const Duration(days: 6)));
    });

    test('un ítem película debe ser devuelto en 3 dias si la duracion es menor a 2 horas', () {
      var pelicula = Pelicula('The Wedding Bride', Duration(minutes: 100), ['Jed Mosly'], 'codigo');

      expect(pelicula.devolverEn(), equals(const Duration(days: 3)));
    });

    test('un ítem película debe ser devuelta en 5 dias si la duracion es mayor o igual a 2 horas', () {
      var pelicula = Pelicula('The Wedding Bride 2', const Duration(minutes: 120), ['Jed Mosly'], 'codigo');

      expect(pelicula.devolverEn(), equals(const Duration(days: 5)));
    });

    test('un ítem revista debe ser devuelta en 2 días si su publicacion fue anterior a 1980', () {
      var revista = Revista('Them', 66, DateTime(1957), ['Tu bebe quiere matarte?, Como saber si tu perro es un asesino serial'], 'codigo');

      expect(revista.devolverEn(), equals(const Duration(days: 2)));
    });

    test('un ítem revista debe ser devuelta en 3 días si su publicacion fue entre 1980 y 2000', () {
      var revista = Revista('Them', 3942, DateTime(1996), ['Tu bebe quiere matarte?, Como saber si tu perro es un asesino serial'], 'codigo');

      expect(revista.devolverEn(), equals(const Duration(days: 3)));
    });

    test('un ítem revista debe ser devuelta en 5 días si su publicación fue en o después del 2000', () {
      var revista = Revista('Them', 89763, DateTime(2003), ['Tu bebe quiere matarte?, Como saber si tu perro es un asesino serial'], 'codigo');

      expect(revista.devolverEn(), equals(const Duration(days: 5)));
    });
  });
  
  group('descripción', () { 
    test('la descripción de un libro es la combinación del título y el autor', () {
      var libro = Libro('The Bro Code', 'Barney Stinson', 536, 'Un resumen', 'codigo');

      expect(libro.descripcion(), 'The Bro Code - Barney Stinson');
    });

    test('la descripción de una pelicula es la combinación del título y la duración', () {
      var pelicula = Pelicula('The Wedding Bride', const Duration(minutes: 100), ['Jed Mosly'], 'codigo');

      expect(pelicula.descripcion(), 'The Wedding Bride - 1.40hs');
    });

    test('la descripción de una revista es la combinación del título, el número y la fecha de salida', () {
      var revista = Revista('Them', 123456, DateTime(2009, 01, 12), ['Una nota interesante'], 'codigo');

      expect(revista.descripcion(), 'Them - 123456 - 12/1/2009');
    });
  });
}