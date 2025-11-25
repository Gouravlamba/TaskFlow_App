class Task {
  final String id;
  final String title;
  final String? description;

  Task({
    required this.id,
    required this.title,
    this.description,
  });

  Task copyWith({
    String? id,
    String? title,
    String? description,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
