import '../modelo/item.dart';
import '../modelo/libro.dart';
import '../modelo/pelicula.dart';
import '../modelo/revista.dart';

class ItemRepository {
  static List<Item> allItems() {
    Libro libroPrestado = Libro('The Bro Code', 'Barney Stinson', 536, 'Barney nos cuenta las reglas para ser un buen Bro', 'bro_code');
    Pelicula peliculaPrestada = Pelicula('The Wedding Bride II', const Duration(minutes: 120), ['Jed Mosly'], 'wedding_bride_ii');
    Revista revistaPrestada =       Revista('Them', 89763, DateTime(2003), ['Reportera aterriza helicoptero', 'Como saber si tu perro es un asesino serial'], 'them_89763');

    libroPrestado.prestar();
    peliculaPrestada.prestar();
    revistaPrestada.prestar();

    return [
      libroPrestado,peliculaPrestada,revistaPrestada,
      Libro('The Playbook', 'Barney Stinson', 850, 'Barney nos cuenta sus trucos para conquistar mujeres', 'playbook'),
      Pelicula('The Wedding Bride', const Duration(minutes: 100), ['Jed Mosly'], 'wedding_bride'),
      Pelicula('The Wedding Bride III', const Duration(minutes: 90), ['Jed Mosly'], 'wedding_bride_iii'),
      Revista('Them', 66, DateTime(1957), ['Tu bebe quiere matarte?', 'Reportera es atacada por lechuza'], 'them_66'),
    ];
  }

  static List<Item> itemsPrestados() {
    return allItems().where((item) => item.disponible() == false).toList();
  }
}