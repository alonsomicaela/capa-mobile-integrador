import 'package:flutter/material.dart';

class DetalleItemButton extends StatelessWidget {
  const DetalleItemButton({super.key, required this.buttonLabel, required this.callback});

  final String buttonLabel;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
      child: Text(buttonLabel, style: const TextStyle(fontSize: 18),),
    );
  }
}
