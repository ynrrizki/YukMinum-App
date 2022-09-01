import 'package:flutter/material.dart';
import 'package:yukminum_app/ui/pages/user/menus/category/coffe.dart';
import 'package:yukminum_app/ui/pages/user/menus/category/milkshake.dart';
import 'package:yukminum_app/ui/pages/user/menus/category/promo.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        Promo(),
        Coffe(),
        Milkshake(),
      ],
    );
  }
}
