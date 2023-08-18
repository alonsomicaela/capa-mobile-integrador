import 'package:flutter/material.dart';

class DisponibleRow extends StatelessWidget {
  const DisponibleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Icon(IconData(0xf051f, fontFamily: 'MaterialIcons')),
          Text('Disponible', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}