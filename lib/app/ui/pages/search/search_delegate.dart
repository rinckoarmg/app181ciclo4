import 'package:flutter/material.dart';

class StoresSearchDelegate extends SearchDelegate{
  @override
  String? get searchFieldLabel => 'Buscar tienda o producto';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () =>query = '',
        icon: Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: Icon(Icons.arrow_back)
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  Widget _emptyContainer(){
    return Container(
        child: Center(
          child: Icon(Icons.store_mall_directory_outlined, color: Colors.black38, size: 150,)
        ),
      );     
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }
    return Container();
  }

}