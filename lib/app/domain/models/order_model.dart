// To parse this JSON data, do
//
//     final orders = ordersFromMap(jsonString);

import 'dart:convert';

class Orders {
  Orders({
    required this.tienda,
    required this.pedido,
    required this.precio,
    required this.referencia,
    required this.usuario,
  });

  String tienda;
  String pedido;
  int precio;
  String referencia;
  String usuario;

  factory Orders.fromJson(String str) => Orders.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Orders.fromMap(Map<String, dynamic> json) => Orders(
        tienda: json["tienda"],
        pedido: json["pedido"],
        precio: json["precio"],
        referencia: json["referencia"],
        usuario: json["usuario"],
      );

  Map<String, dynamic> toMap() => {
        "tienda": tienda,
        "pedido": pedido,
        "precio": precio,
        "referencia": referencia,
        "usuario": usuario,
      };
}
