import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskflow/presentation/widgets/custom_appbar.dart';

import '../../logic/theme/theme_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state.isDark;

    return Scaffold(
      appBar: const CustomAppBar(title: ""),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 32,
              child: Icon(Icons.person, size: 32),
            ),
            const SizedBox(height: 16),

            // USER NAME
            Text(
              'Gourav Kumar',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            const Text('Scalable Software Developer (Mobile Applications)'),

            const SizedBox(height: 24),

            // ABOUT
            const Text(
              'About',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Highly skilled developer focused on building scalable web and mobile applications. '
              'with a proactive focus on integrating Artificial Intelligence and Machine Learning capabilities.',
            ),

            const SizedBox(height: 32),

            // THEME TOGGLE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Mode',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Switch(
                  value: isDark,
                  onChanged: (_) {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
