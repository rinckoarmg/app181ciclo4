import 'package:flutter/material.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';

class TextConverter extends StatelessWidget {
  @override
  final Listas listas = Listas();
  Widget build(BuildContext context) {
    return Container();
  }

  String iconToCategory(String string) {
    for (int i = 0; i < listas.listIconsLong().length; i++) {
      for (int y = 0; y < listas.listCategories().length; y++) {
        if (string == listas.listIconsLong()[i]) {
          return listas.listCategories()[i];
        }
      }
    }
    return 'La categoria NO existe!';
  }

  String categoryToIcon(String string) {
    for (int y = 0; y < listas.listCategories().length; y++) {
      for (int i = 0; i < listas.listIconsLong().length; i++) {
        if (string == listas.listCategories()[y]) {
          return listas.listIconsLong()[y];
        }
      }
    }
    return 'La categoria NO existe!';
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

}
