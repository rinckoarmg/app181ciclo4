import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movil181/app/domain/models/models.dart';

class StoreService extends ChangeNotifier {
  final String _baseUrl = 'mi-barrio-177fd-default-rtdb.firebaseio.com';
  final List<Stores> listStores = [];
  final List<Stores> list1 = [];
  final List<Stores> list2 = [];
  final List<Stores> list3 = [];
  final List<Stores> list4 = [];
  final List<Stores> list5 = [];
  final List<Stores> list6 = [];
  final List<Stores> list7 = [];
  final List<Stores> list8 = [];
  final List<Stores> list9 = [];
  final List<Stores> list10 = [];
  final List<Stores> list11 = [];
  final List<Stores> list12 = [];
  final List<Stores> list13 = [];
  final List<Stores> list14 = [];
  final List<Stores> list15 = [];
  final List<Stores> list16 = [];
  final List<Stores> list17 = [];
  final List<Stores> listProductos = [];
  final List<Stores> listServicios = [];

  late Stores selectedStore;

  File? newPhoto;
  bool isLoading = true;
  bool isSaving = false;

  StoreService() {
    loadStores();
  }

  Future<List<Stores>> loadStores() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, '/store.json');
    final resp = await http.get(url);
    final Map<String, dynamic> projectMap = json.decode(resp.body);
    //print(projectMap);

    projectMap.forEach((key, value) {
      final tempStores = Stores.fromMap(value);
      tempStores.id = key;
      listStores.add(tempStores);
      if (tempStores.category == 'Restaurantes.png' ||
          tempStores.category == 'Farmacias.png' ||
          tempStores.category == 'Licores.png' ||
          tempStores.category == 'Minimercado.png' ||
          tempStores.category == 'Panaderias.png') {
        listProductos.add(tempStores);
      }
      if (tempStores.category == 'Paseador.png' ||
          tempStores.category == 'Plomeria.png' ||
          tempStores.category == 'Cerrajeria.png' ||
          tempStores.category == 'Electricos.png' ||
          tempStores.category == 'Domesticos.png') {
        listServicios.add(tempStores);
      }

      if (tempStores.category == 'Restaurantes.png') {
        list1.add(tempStores);
      }
      if (tempStores.category == 'Farmacias.png') {
        list2.add(tempStores);
      }
      if (tempStores.category == 'Licores.png') {
        list3.add(tempStores);
      }
      if (tempStores.category == 'Minimercado.png') {
        list4.add(tempStores);
      }
      if (tempStores.category == 'Panaderias.png') {
        list5.add(tempStores);
      }
      if (tempStores.category == 'Paseador.png') {
        list6.add(tempStores);
      }
      if (tempStores.category == 'Plomeria.png') {
        list7.add(tempStores);
      }
      if (tempStores.category == 'Cerrajeria.png') {
        list8.add(tempStores);
      }
      if (tempStores.category == 'Electricos.png') {
        list9.add(tempStores);
      }
      if (tempStores.category == 'Domesticos.png') {
        list10.add(tempStores);
      }
    });

    isLoading = false;
    notifyListeners();

    //print(listStores);
    return listStores;
  }

  Future saveStore(Stores project) async {
    isSaving = true;
    notifyListeners();

    if (project.id == null) {
      await createStore(project);
    } else {
      await this.updateStore(project);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateStore(Stores project) async {
    final url = Uri.https(_baseUrl, '/project/${project.id}.json');
    final resp = await http.put(url, body: project.toJson());
    final decodeData = resp.body;

    print(decodeData);

    final index = listStores.indexWhere((i) => i.id == project.id);
    listStores[index] = project;
    return project.id!;
  }

  Future<String> createStore(Stores project) async {
    final url = Uri.https(_baseUrl, '/project.json');
    final resp = await http.post(url, body: project.toJson());
    final decodeData = json.decode(resp.body);

    project.id = decodeData['name'];

    this.listStores.add(project);
    return project.id!;
  }

  void updatePhoto(String path) {
    selectedStore.image = path;
    newPhoto = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadPhoto() async {
    if (newPhoto == null) return null;
    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/rinckoar/image/upload?upload_preset=odsxcambio');

    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', newPhoto!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final res = await http.Response.fromStream(streamResponse);

    if (res.statusCode != 200 && res.statusCode != 201) {
      print('error');
      print(res.body);
      return null;
    }
    newPhoto = null;

    final decodeData = json.decode(res.body);
    return decodeData['secure_url'];
  }
}
