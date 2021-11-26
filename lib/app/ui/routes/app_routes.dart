import 'package:flutter/widgets.dart' show BuildContext, Container, Widget;
import 'package:movil181/app/ui/pages/account/account_page.dart';
import 'package:movil181/app/ui/pages/add_store/add_store_page.dart';
import 'package:movil181/app/ui/pages/home/home_page.dart';
import 'package:movil181/app/ui/pages/login/login_page.dart';
import 'package:movil181/app/ui/pages/product/product_page.dart';
import 'package:movil181/app/ui/pages/store/store_page.dart';
import 'package:movil181/app/ui/pages/register/register_page.dart';
import 'package:movil181/app/ui/pages/splash/splash_page.dart';
import 'package:movil181/app/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.SPLASH: (_) => const SplashPage(),
      Routes.LOGIN: (_) => const LoginPage(),
      Routes.REGISTER: (_) => const RegisterPage(),
      Routes.HOME: (_) => const HomePage(),
      Routes.PROJECT: (_) => const StorePage(),
      Routes.ADDPROJECT: (_) => const AddStorePage(),
      Routes.PRODUCT: (_) => const ProductPage(),
      Routes.ACCOUNT: (_) => const AccountPage(),
    };
