import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskflow/presentation/widgets/custom_appbar.dart';

import '../../logic/task/task_cubit.dart';
import '../../logic/task/task_state.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/task_item_widget.dart';
import 'add_task_screen.dart';
import 'edit_task_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: ""),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          if (state.isLoading && state.tasks.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null && state.tasks.isEmpty) {
            return Center(child: Text(state.error!));
          }

          if (state.tasks.isEmpty) {
            return const EmptyStateWidget(
              message: 'No tasks found.\nTap + to add a new task.',
            );
          }

          return RefreshIndicator(
            onRefresh: () => context.read<TaskCubit>().loadTasks(),
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: state.tasks.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return TaskItemWidget(
                  task: task,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => EditTaskScreen(task: task),
                      ),
                    );
                  },
                  onDelete: () async {
                    await context.read<TaskCubit>().deleteTask(task.id);
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
