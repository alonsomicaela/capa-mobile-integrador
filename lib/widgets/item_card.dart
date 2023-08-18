import 'package:flutter/material.dart';
import 'package:integrador/widgets/cantidad_prestamos.dart';
import 'package:integrador/widgets/disponible_row.dart';

import 'data_prestamo.dart';
import '../detalle_item_page.dart';
import '../modelo/item.dart';


class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item, required this.updateItemList});

  final Item item;
  final void Function(Item) updateItemList;

  void navegar(context, pine) {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => DetalleItemPage(item: item, updateItemList: updateItemList)
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      key: key,
      child: InkWell(
        onTap: () => navegar(context, item),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.descripcion(), style: const TextStyle(fontSize: 22)),
                    item.disponible() ? const DisponibleRow() : DataPrestamo(item: item),
                    CantidadPrestamos(item: item),
                  ],
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: Icon(IconData(0xea4e, fontFamily: 'MaterialIcons'),),
            ),
          ],
        ),
      ),
    );
  }
}
