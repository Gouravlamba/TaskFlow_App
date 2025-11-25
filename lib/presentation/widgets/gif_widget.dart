import 'package:flutter/material.dart';

class GifWidget extends StatelessWidget {
  const GifWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: ClipRRect(
        child: Image.asset(
          isDark ? "assets/gif/gif3.gif" : "assets/gif/gif2.gif",
          height: 300,
          width: 400,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
