import 'package:flutter/material.dart';
import 'package:startfirstdemo/main.dart';

class AppBarDisplay extends StatelessWidget with PreferredSizeWidget {
  AppBarDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('To do App'),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          appTheme.toggleTheme();
        },
        icon: const Icon(Icons.menu),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
