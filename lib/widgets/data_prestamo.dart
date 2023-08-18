import 'package:flutter/material.dart';
import 'package:integrador/fecha_helper.dart';

import '../modelo/item.dart';
import '../modelo/prestamo.dart';
import '../repositories/prestamo_repository.dart';
import 'fecha_devolucion_row.dart';

class DataPrestamo extends StatelessWidget {
  const DataPrestamo({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    Prestamo prestamo = PrestamoRepository.findPrestamoVigenteDe(item);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(IconData(0xf051f, fontFamily: 'MaterialIcons')),
              Text(
                'Reservado por ${prestamo.persona()} el ${FechaHelper.fechaToString(prestamo.fechaInicio())}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
          child: FechaDevolucionRow(fechaDevolucion: DateTime.now()),
        ),
      ],
    );
  }
}
