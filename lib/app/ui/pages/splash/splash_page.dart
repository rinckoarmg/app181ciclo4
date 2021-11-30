import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:movil181/app/ui/global_controllers/session_controller.dart';
import 'package:movil181/app/ui/pages/splash/splash_controller.dart';
//import 'package:flutter_meedu/state.dart';
import 'package:flutter_meedu/router.dart' as router;

final splashprovider = SimpleProvider(
  (_) => SplashController(sessionProvider.read),
);

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
      provider: splashprovider,
      onChange: (_, controller) {
        final routeName = controller.routeName;

        if (routeName != null) {
          router.pushReplacementNamed(routeName);
        }
      },
      builder: (_, __) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
