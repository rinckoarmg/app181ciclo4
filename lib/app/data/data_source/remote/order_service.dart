import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/global_controllers/session_controller.dart';
import 'package:movil181/app/ui/pages/account/tabs/account/account_tab.dart';
import 'package:movil181/app/ui/pages/account/tabs/stores/store_profile_tab.dart';
import 'package:movil181/app/ui/pages/pages.dart';

class OrderService extends ChangeNotifier {
  final String _baseUrl = 'categorias-app-default-rtdb.firebaseio.com';
  final List<Orders> listOrder = [];
  final List<Orders> listOrderXUser = [];

  late Orders selectedOrder;

  bool isLoading = true;
  bool isSaving = false;

  OrderService() {
    loadOrder();
  }

  Future<List<Orders>> loadOrder() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, '/pedidos.json');
    final resp = await http.get(url);
    final Map<String, dynamic> orderMap = json.decode(resp.body);

    orderMap.forEach((key, value) {
      final tempOrder = Orders.fromMap(value);
      tempOrder.referencia = key;
      listOrder.add(tempOrder);
      // if (tempOrder.usuario == usuarioR.dName) {
      //   listOrderXUser.add(tempOrder);
      // }
    });

    isLoading = false;
    notifyListeners();

    return listOrder;
  }

  Future saveOrder(Orders order) async {
    isSaving = true;
    notifyListeners();

    if (order.referencia == null) {
      await createOrder(order);
    } else {
      await this.updateOrder(order);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateOrder(Orders order) async {
    final url = Uri.https(_baseUrl, '/pedidos/${order.referencia}.json');
    final resp = await http.put(url, body: order.toJson());
    final decodeData = resp.body;

    print(decodeData);

    final index = listOrder.indexWhere((i) => i.referencia == order.referencia);
    listOrder[index] = order;
    return order.referencia;
  }

  Future<String> createOrder(Orders order) async {
    final url = Uri.https(_baseUrl, '/pedidos.json');
    final resp = await http.post(url, body: order.toJson());
    final decodeData = json.decode(resp.body);

    order.referencia = decodeData['referencia'];

    listOrder.add(order);
    return order.referencia;
  }

  // Consumer(builder: (_, ref, __) {
  //                     final user =
  //                         ref.select(sessionProvider.select((_) => _.user));
  //                     return Text(user!.phoneNumber ?? '3333333333',
  //                         style: textTheme.subtitle1);
  //                   }),
}
