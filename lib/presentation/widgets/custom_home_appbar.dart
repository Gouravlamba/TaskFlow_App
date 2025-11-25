import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomHomeAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leadingWidth: 380,
      leading: Builder(
        builder: (context) {
          return Row(
            children: [
              IconButton(
                icon:
                    const Icon(Icons.menu, size: 28, color: Color(0xFF11224E)),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Image.asset(
                  "assets/images/task.png",
                  height: 150,
                  width: 180,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          );
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
