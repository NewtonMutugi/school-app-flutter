class Task {
  int id;
  String name;
  String description;
  DateTime deadline;
  bool completed;
  int userId;

  Task({
    required this.id,
    required this.name,
    required this.description,
    required this.deadline,
    this.completed = false,
    required this.userId,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        deadline: DateTime.parse(json['deadline']),
        completed: json['completed'],
        userId: json['user_id'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'deadline': deadline.toIso8601String(),
        'completed': completed,
        'user_id': userId,
      };
}
