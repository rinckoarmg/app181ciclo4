import 'dart:io';

import 'package:flutter/material.dart';

class StoreImage extends StatelessWidget {
  final String? url;

  const StoreImage({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 200,
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20), child: getImage(url)),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 5))
          ]);

  Widget getImage(String? photo) {
    if (photo == null)
      return Image(
        image: AssetImage('assets/no-image.png'),
        fit: BoxFit.cover,
      );

    if (photo.startsWith('http'))
      return FadeInImage(
        image: NetworkImage(this.url!),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fit: BoxFit.cover,
      );

    return Image.file(
      File(photo),
      fit: BoxFit.cover,
    );
  }
}
