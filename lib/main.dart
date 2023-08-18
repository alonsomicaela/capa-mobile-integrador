import 'package:flutter/material.dart';
import 'package:integrador/repositories/item_repository.dart';

import 'modelo/item.dart';
import 'widgets/item_card.dart';
import 'modelo/libro.dart';
import 'modelo/pelicula.dart';
import 'modelo/revista.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventario',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade800),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Inventario'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();

    items = ItemRepository.allItems();
  }

  void updateItemList(Item itemNuevo) {
    print('holis holaaaas');
    Item itemViejo = items.where((item) => item.codigoInterno() == itemNuevo.codigoInterno()).first;
    int itemIndex = items.indexOf(itemViejo);
    items[itemIndex] = itemNuevo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: Center(child: Text(widget.title)),
      ),
      body: ListView(
        children: [
          for (Item item in items)
            ItemCard(item: item, updateItemList: updateItemList)
        ],
      ),
    );
  }
}
