class DailyReminderModel {
  final String id;
  final String title;
  final String description;
  final String time;
  final bool isEnabled;
  final DateTime createdAt;

  DailyReminderModel({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.isEnabled,
    required this.createdAt,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'time': time,
      'isEnabled': isEnabled,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Convert from JSON
  factory DailyReminderModel.fromJson(Map<String, dynamic> json) {
    return DailyReminderModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      time: json['time'] as String,
      isEnabled: json['isEnabled'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  DailyReminderModel copyWith({
    String? id,
    String? title,
    String? description,
    String? time,
    bool? isEnabled,
    DateTime? createdAt,
  }) {
    return DailyReminderModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      isEnabled: isEnabled ?? this.isEnabled,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
