import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:provider/provider.dart';

class UserStoreCard extends StatelessWidget {
  final Stores uStore;

  const UserStoreCard({Key? key, required this.uStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeService = Provider.of<StoreService>(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 7.5),
                  blurRadius: 10,
                )
              ]),
          child: Stack(
            children: [
              _StoreDetails(uStore),
              Positioned(
                  top: 0,
                  right: 10,
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          storeService.selectedStore;
                          Navigator.pushNamed(context, Routes.ADDPROJECT);
                        },
                        icon: Icon(Icons.edit),
                        label: Text('Editar', style: textTheme.headline5),
                        // child: Text('Editar', style: textTheme.headline5),
                      )
                    ],
                  )),
            ],
          )),
    );
  }
}

class _StoreDetails extends StatelessWidget {
  final Stores uStore;

  const _StoreDetails(this.uStore);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 120),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.teal[300],
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                uStore.name,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
    );
  }
}
