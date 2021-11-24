import 'package:flutter/material.dart';

class Listas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  List<String> listIcons() {
    List<String> listIcons = [
      'Restaurantes.png',
      'Farmacias.png',
      'Licores.png',
      'Minimercado.png',
      'Panaderias.png',
      'Paseador.png',
      'Plomeria.png',
      'Cerrajeria.png',
      'Electricos.png',
      'Domesticos.png'
    ];
    return listIcons;
  }

  List<String> listCategories() {
    List<String> listCategories = [
      'Restaurantes',
      'Farmacias',
      'Licores',
      'Minimercado',
      'Panaderías',
      'Paseador de perros',
      'Plomería',
      'Cerrajería',
      'Servicios eléctricos',
      'Servicios domésticos'
    ];
    return listCategories;
  }
}
