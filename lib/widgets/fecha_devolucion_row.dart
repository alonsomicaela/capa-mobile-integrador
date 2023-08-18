import 'package:flutter/cupertino.dart';

import '../fecha_helper.dart';

class FechaDevolucionRow extends StatelessWidget {
  const FechaDevolucionRow({super.key, required this.fechaDevolucion});

  final DateTime fechaDevolucion;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        const Icon(
          IconData(
              0xf585,
              fontFamily: 'MaterialIcons',
              matchTextDirection: true),
        ),
        Text(
          'Devolución prevista: ${FechaHelper.fechaToString(fechaDevolucion)}',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}