import 'package:flutter/material.dart';
import 'package:movil181/app/domain/models/models.dart';

class StoreCard extends StatelessWidget {
  final Stores store;

  const StoreCard({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 120,
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
              _CardImage(store.image),
              _StoreDetails(store.name),
              // Positioned(
              //     bottom: 0, left: 0, child: _TributeField(store.atribution)),
              Positioned(
                  bottom: 0, right: 0, child: _CategorieIcon(store.category)),
            ],
          )),
    );
  }
}

class _CategorieIcon extends StatelessWidget {
  final String? innerImage;

  const _CategorieIcon(this.innerImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20), topRight: Radius.circular(20)),
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: AssetImage('assets/${innerImage}'),
          fit: BoxFit.cover,
        ),
      ),
      width: 55,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20), topRight: Radius.circular(20))),
    );
  }
}

class _StoreDetails extends StatelessWidget {
  final String title;

  const _StoreDetails(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 100),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 14,
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

class _CardImage extends StatelessWidget {
  final String? url;

  const _CardImage(this.url);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 55),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
        child: Container(
          width: double.infinity,
          child: url == null
              ? Image(image: AssetImage('assets/no-image.png'), fit: BoxFit.cover)
              : FadeInImage(
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(url!),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}

// class _TributeField extends StatelessWidget {
//   const _TributeField(this.atribution);
//   final String? atribution;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(right: 80),
//       child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           height: 30,
//           decoration: BoxDecoration(
//               color: Colors.black12,
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   topRight: Radius.circular(20))),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '* ' + atribution!,
//                 style: TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           )),
//     );
//   }
// }

