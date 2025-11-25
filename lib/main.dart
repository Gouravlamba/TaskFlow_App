import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskflow/logic/theme/theme_cubit.dart';
import 'package:taskflow/logic/theme/theme_state.dart';

import 'config/theme/light_theme.dart';
import 'config/theme/dark_theme.dart';
import 'data/data_source/local_json_loader.dart';
import 'data/repository/task_repository.dart';
import 'logic/task/task_cubit.dart';
import 'presentation/navigation/bottom_nav_screen.dart';

void main() {
  final jsonLoader = LocalJsonLoader();
  final taskRepository = TaskRepository(jsonLoader: jsonLoader);

  runApp(TaskFlowApp(taskRepository: taskRepository));
}

class TaskFlowApp extends StatelessWidget {
  final TaskRepository taskRepository;

  const TaskFlowApp({super.key, required this.taskRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TaskCubit(taskRepository: taskRepository)..loadTasks(),
        ),
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'TaskFlow',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeState.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const BottomNavScreen(),
          );
        },
      ),
    );
  }
}
