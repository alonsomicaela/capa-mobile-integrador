import 'package:flutter/material.dart';
import 'package:integrador/repositories/item_repository.dart';
import 'package:integrador/repositories/prestamo_repository.dart';
import 'package:integrador/widgets/cantidad_prestamos.dart';
import 'package:integrador/widgets/data_prestamo.dart';
import 'package:integrador/widgets/detalle_item_button.dart';
import 'package:integrador/widgets/disponible_row.dart';
import 'package:integrador/widgets/fecha_devolucion_row.dart';

import 'fecha_helper.dart';
import 'modelo/item.dart';
import 'modelo/prestamo.dart';

class DetalleItemPage extends StatefulWidget {
  const DetalleItemPage({super.key, required this.item, required this.updateItemList});

  final Item item;
  final void Function(Item) updateItemList;

  @override
  State<DetalleItemPage> createState() => _DetalleItemPageState();
}

class _DetalleItemPageState extends State<DetalleItemPage> {
  var persona;

  @override
  void initState() {
    super.initState();

    persona = '';
  }

  @override
  Widget build(BuildContext context) {
    var item = widget.item;

    void prestar() {
      Item itemNuevo = item.copy();
      Prestamo prestamo = PrestamoRepository.crear(itemNuevo, persona);
      itemNuevo.prestar();

      widget.updateItemList(itemNuevo);
    }

    void devolver() {
      print('devolver');
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: Text(item.titulo()),
      ),
      bottomSheet: item.disponible()
          ? DetalleItemButton(buttonLabel: 'Prestar', callback: prestar)
          : DetalleItemButton(buttonLabel: 'Devolver', callback: devolver),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(child: Image.asset('assets/${item.codigoInterno()}.jpeg', semanticLabel: 'Una foto del item', height: 184,),),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(item.descripcion(), style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                  ),
                  Text(item.info(), style: const TextStyle(fontSize: 18),),
                  item.disponible() ? const DisponibleRow() : DataPrestamo(item: item,),
                  CantidadPrestamos(item: item),
                  if (item.disponible())
                    Column(
                      children: [
                        Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          children: [
                            const Icon(IconData(0xe3fe, fontFamily: 'MaterialIcons')),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Prestar a',
                                  ),
                                  onSubmitted: (String newText) {
                                    if (newText.isNotEmpty) {
                                      setState(() {
                                        persona = newText;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        ),
                        FechaDevolucionRow(
                            fechaDevolucion: FechaHelper.fechaDevolucionParaItemDisponible(item),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );  }
}
