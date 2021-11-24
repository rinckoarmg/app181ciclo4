import 'package:flutter/material.dart';
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

        //ChangeNotifierProvider(create: (_) => AddStoreController()),
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
          //primarySwatch: Colors.,
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.purple),
          )),
      title: 'APP movil 181',
      navigatorKey: router.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      routes: appRoutes,
      navigatorObservers: [
        router.observer,
      ],
    );
  }
}
