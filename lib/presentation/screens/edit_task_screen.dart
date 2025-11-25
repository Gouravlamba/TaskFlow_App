import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskflow/presentation/widgets/custom_appbar.dart';

import '../../data/models/task_model.dart';
import '../../logic/task/task_cubit.dart';
import '../../utils/validators.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;

  const EditTaskScreen({super.key, required this.task});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descController =
        TextEditingController(text: widget.task.description ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _update() async {
    if (_formKey.currentState?.validate() ?? false) {
      final updated = widget.task.copyWith(
        title: _titleController.text.trim(),
        description: _descController.text.trim(),
      );
      await context.read<TaskCubit>().updateTask(updated);
      if (mounted) Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ⭐ CUSTOM APPBAR + BACK BUTTON ADDED HERE
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Stack(
          children: [
            const CustomAppBar(title: "Edit"),
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back,
                    color: Color.fromARGB(255, 217, 123, 155)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title *',
                  border: OutlineInputBorder(),
                ),
                validator: Validators.requiredField,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _update,
                  child: const Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
