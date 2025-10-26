import 'package:egtema3elegtema3el3am/widgets/customtext.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          color: const Color(0xFF9A3F3F),
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      title: Center(
        child: CustomText(
            text: text,
            isBold: true,
            colours: 0xFF9A3F3F,
            fontSize: 20,
            align: TextAlign.center),
      ),
      backgroundColor: const Color(0xFFC1856D),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
