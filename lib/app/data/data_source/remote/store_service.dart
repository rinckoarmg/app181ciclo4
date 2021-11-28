import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';

class StoreService extends ChangeNotifier {
  final String _baseUrl = 'mi-barrio-177fd-default-rtdb.firebaseio.com';
  final List listaGeneral = [
    [],[],[],[],[],[],[],[],[],[],[]
  ];
  
  final List<Stores> listStores = [];
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
      Listas listas = Listas();

      if (tempStores.category == listas.listIconsLong()[0] ||
          tempStores.category == listas.listIconsLong()[1] ||
          tempStores.category == listas.listIconsLong()[2] ||
          tempStores.category == listas.listIconsLong()[3] ||
          tempStores.category == listas.listIconsLong()[4]) {
        listProductos.add(tempStores);
      }
      if (tempStores.category == listas.listIconsLong()[5] ||
          tempStores.category == listas.listIconsLong()[6] ||
          tempStores.category == listas.listIconsLong()[7] ||
          tempStores.category == listas.listIconsLong()[8] ||
          tempStores.category == listas.listIconsLong()[9]) {
        listServicios.add(tempStores);
      }

      for (int i=0;i<listas.listIconsLong().length;i++) {
        if (tempStores.category == listas.listIconsLong()[i]) {
        listaGeneral[i].add(tempStores);
        }
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
