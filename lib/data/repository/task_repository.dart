import '../data_source/local_json_loader.dart';
import '../models/task_model.dart';

class TaskRepository {
  final LocalJsonLoader jsonLoader;

  TaskRepository({required this.jsonLoader});

  bool _initialized = false;
  final List<Task> _tasks = [];

  Future<List<Task>> loadTasks() async {
    if (!_initialized) {
      final jsonList = await jsonLoader.loadTasksJson();
      _tasks.clear();
      _tasks.addAll(jsonList.map(Task.fromJson));
      _initialized = true;
    }
    return List.unmodifiable(_tasks);
  }

  Future<List<Task>> getTasks() async {
    if (!_initialized) {
      await loadTasks();
    }
    return List.unmodifiable(_tasks);
  }

  Future<List<Task>> addTask(String title, String? description) async {
    final newTask = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
    );
    _tasks.add(newTask);
    return List.unmodifiable(_tasks);
  }

  Future<List<Task>> updateTask(Task updatedTask) async {
    final index = _tasks.indexWhere((t) => t.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
    }
    return List.unmodifiable(_tasks);
  }

  Future<List<Task>> deleteTask(String id) async {
    _tasks.removeWhere((t) => t.id == id);
    return List.unmodifiable(_tasks);
  }
}
