import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/product_service.dart';
import 'package:movil181/app/domain/repositories/authentication_repository.dart';
import 'package:movil181/app/ui/pages/add_store/add_store_controller.dart';
import 'package:movil181/app/ui/routes/app_routes.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:provider/provider.dart';
import 'data/data_source/remote/services.dart';

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StoreService()),
        ChangeNotifierProvider(create: (_) => ProductService()),
        ChangeNotifierProvider(create: (_) => OrderService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
            button: TextStyle(fontSize: 30),
            headline6: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Monserrat',
                fontSize: 18,
                color: Colors.teal[800]),
            headline5: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Monserrat',
                fontSize: 22,
                color: Colors.teal[800]),
            headline4: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Monserrat',
                fontSize: 24,
                color: Colors.teal[800]),
            bodyText1: TextStyle(
              fontFamily: 'Monserrat',
              fontSize: 16,
              color: Colors.black54,
            ),
            bodyText2: TextStyle(
              fontFamily: 'Monserrat',
              fontSize: 15,
              color: Colors.black54,
            ),
            subtitle2: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Monserrat',
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          //primarySwatch: Colors.,
          primarySwatch: Colors.teal,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            //iconTheme: IconThemeData(color: Colors.teal[800]),
          )),
      title: 'APP movil 181',
      navigatorKey: router.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      routes: appRoutes,
      navigatorObservers: [
        router.observer,
      ],
    );
  }
}
