import 'package:flutter/material.dart';
import 'package:movil181/app/domain/models/models.dart';

class ProductCard extends StatelessWidget {
  final Productos product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
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
              _CardImage(product.imagen),
              _ProductDetails(product.nombre),
              // Positioned(
              //     bottom: 0, left: 0, child: _TributeField(store.atribution)),
            ],
          )),
    );
  }
}

// class _CategorieIcon extends StatelessWidget {
//   final String? innerImage;

//   const _CategorieIcon(this.innerImage);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FittedBox(
//         fit: BoxFit.contain,
//         child: ClipRRect(
//           borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(60), topRight: Radius.circular(60)),
//           child: FadeInImage(
//             placeholder: AssetImage('assets/jar-loading.gif'),
//             image: AssetImage('assets/${innerImage}'),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       width: 60,
//       height: 120,
//       decoration: BoxDecoration(
//           color: Colors.purple,
//           borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(20), topRight: Radius.circular(20))),
//     );
//   }
// }

class _ProductDetails extends StatelessWidget {
  final String title;

  const _ProductDetails(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          height: 37,
          decoration: BoxDecoration(
              color: Colors.black38,
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

class _CardImage extends StatelessWidget {
  final String? url;

  const _CardImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
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
    );
  }
}
