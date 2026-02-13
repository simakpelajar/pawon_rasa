class DailyReminderEntity {
  final String id;
  final String title;
  final String description;
  final String time;
  final bool isEnabled;
  final DateTime createdAt;

  DailyReminderEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.isEnabled,
    required this.createdAt,
  });

  DailyReminderEntity copyWith({
    String? id,
    String? title,
    String? description,
    String? time,
    bool? isEnabled,
    DateTime? createdAt,
  }) {
    return DailyReminderEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      isEnabled: isEnabled ?? this.isEnabled,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
