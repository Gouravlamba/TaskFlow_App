import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/task_model.dart';
import '../../data/repository/task_repository.dart';
import 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository taskRepository;

  TaskCubit({required this.taskRepository}) : super(TaskState.initial());

  Future<void> loadTasks() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final tasks = await taskRepository.loadTasks();
      emit(state.copyWith(
        tasks: tasks,
        isLoading: false,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Failed to load tasks',
      ));
    }
  }

  Future<void> addTask(String title, String? description) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final tasks = await taskRepository.addTask(title, description);
      emit(state.copyWith(
        tasks: tasks,
        isLoading: false,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Failed to add task',
      ));
    }
  }

  Future<void> updateTask(Task task) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final tasks = await taskRepository.updateTask(task);
      emit(state.copyWith(
        tasks: tasks,
        isLoading: false,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Failed to update task',
      ));
    }
  }

  Future<void> deleteTask(String id) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final tasks = await taskRepository.deleteTask(id);
      emit(state.copyWith(
        tasks: tasks,
        isLoading: false,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Failed to delete task',
      ));
    }
  }
}
