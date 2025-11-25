import 'package:flutter/material.dart';
import '../../data/models/task_model.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const TaskItemWidget({
    super.key,
    required this.task,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFF875AA),
            Color.fromARGB(190, 241, 147, 65),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          onTap: onTap,
          title: Text(
            task.title,
            style: const TextStyle(
              color: Color(0xFF11224E),
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: task.description != null && task.description!.isNotEmpty
              ? Text(
                  task.description!,
                  style: const TextStyle(
                    color: Color(0xFF11224E),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              : null,
          trailing: IconButton(
            icon: const Icon(
              Icons.delete_outline,
              color: Color(0xFF11224E),
            ),
            onPressed: onDelete,
          ),
        ),
      ),
    );
  }
}
