import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';

class AccountController extends SimpleNotifier {
  late TabController tabController;
  AccountController() {
    tabController = TabController(
      length: 3,
      vsync: NavigatorState(),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
