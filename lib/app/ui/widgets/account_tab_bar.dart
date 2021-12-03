import 'package:flutter/material.dart';
import 'package:movil181/app/ui/pages/account/account_page.dart';

class AccountTabBar extends StatelessWidget {
  AccountTabBar({Key? key}) : super(key: key);
  final _accountController = accountProvider.read;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: TabBar(
        unselectedLabelColor: Colors.black54,
        labelColor: Colors.teal,
        //indicator: _CustomIndicator(),
        tabs: [
          Tab(icon: Icon(Icons.account_box_rounded)),
          Tab(icon: Icon(Icons.store)),
          Tab(icon: Icon(Icons.scatter_plot_rounded)),
        ],
        controller: _accountController.tabController,
      ),
    );
  }
}

class _CustomIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter();
  }
}

class _CirclePainter extends BoxPainter {
  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    final size = configuration.size!;
    final paint = Paint();
    paint.color = Colors.teal;
    final center = Offset(offset.dx + size.width * 0.5, size.height * 0.9);
    canvas.drawCircle(center, 3, paint);
  }
}
