import 'package:flutter/material.dart';

import '../modelo/item.dart';

class CantidadPrestamos extends StatelessWidget {
  const CantidadPrestamos({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(item.prestamos().toString(), style: const TextStyle(fontSize: 18)),
        const Icon(IconData(0xf00f0, fontFamily: 'MaterialIcons')),
      ],
    );
  }
}