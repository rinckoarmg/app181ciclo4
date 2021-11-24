import 'package:flutter/material.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';

class TextConverter extends StatelessWidget {
  @override
  final Listas listas = Listas();
  Widget build(BuildContext context) {
    return Container();
  }

  String iconToCategory(String string) {
    for (int i = 0; i < listas.listIcons().length; i++) {
      for (int y = 0; y < listas.listCategories().length; y++) {
        if (string == listas.listIcons()[i]) {
          return listas.listCategories()[i];
        }
      }
    }
    return 'La categoria NO existe!';
  }

  String categoryToIcon(String string) {
    for (int y = 0; y < listas.listCategories().length; y++) {
      for (int i = 0; i < listas.listIcons().length; i++) {
        if (string == listas.listCategories()[y]) {
          return listas.listIcons()[y];
        }
      }
    }
    return 'La categoria NO existe!';
  }

  String textCategory(String string) {
    if (string == 'Restaurantes.png') {
      return 'Restaurantes';
    }
    if (string == 'Farmacias.png') {
      return 'Farmacias';
    }
    if (string == 'Licores.png') {
      return 'Licores';
    }
    if (string == 'Minimercado.png') {
      return 'Minimercado';
    }
    if (string == 'Panaderias.png') {
      return 'Panaderías';
    }
    if (string == 'Paseador.png') {
      return 'Paseador de perros';
    }
    if (string == 'Plomeria.png') {
      return 'Plomería';
    }
    if (string == 'Cerrajeria.png') {
      return 'Cerrajería';
    }
    if (string == 'Electricos.png') {
      return 'Servicios eléctricos';
    }
    if (string == 'Domesticos.png') {
      return 'Servicios domésticos';
    } else {
      return 'La categoria NO existe!';
    }
  }

  String infoCategory(String icon) {
    if (icon == 'Restaurantes.png') {
      return 'Restaurantes';
    }
    if (icon == 'Farmacias.png') {
      return 'Farmacias';
    }
    if (icon == 'Licores.png') {
      return 'Licores';
    }
    if (icon == 'Minimercado.png') {
      return 'Minimercado';
    }
    if (icon == 'Panaderias.png') {
      return 'Panaderías';
    }
    if (icon == 'Paseador.png') {
      return 'Paseador de perros';
    }
    if (icon == 'Plomeria.png') {
      return 'Plomería';
    }
    if (icon == 'Cerrajeria.png') {
      return 'Cerrajería';
    }
    if (icon == 'Electricos.png') {
      return 'Servicios eléctricos';
    }
    if (icon == 'Domesticos.png') {
      return 'Servicios domésticos';
    } else {
      return 'La categoria NO existe!';
    }
  }

  String textIcon(String text) {
    if (text == 'Restaurantes') {
      return 'Restaurantes.png';
    }
    if (text == 'Farmacias') {
      return 'Farmacias.png';
    }
    if (text == 'Licores') {
      return 'Licores.png';
    }
    if (text == 'Minimercado') {
      return 'Minimercado.png';
    }
    if (text == 'Panaderías') {
      return 'Panaderias.png';
    }
    if (text == 'Paseador de perros') {
      return 'Paseador.png';
    }
    if (text == 'Plomería') {
      return 'Plomeria.png';
    }
    if (text == 'Cerrajería') {
      return 'Cerrajeria.png';
    }
    if (text == 'Servicios eléctricos') {
      return 'Electricos.png';
    }
    if (text == 'Servicios domésticos') {
      return 'Domesticos.png';
    } else {
      return 'La categoria NO existe!';
    }
  }
}
