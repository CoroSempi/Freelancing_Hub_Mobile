class NotificationModel {
  final String id;
  final String content;
  final bool seen;

  NotificationModel({
    required this.id,
    required this.content,
    required this.seen,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id'],
      content: json['content'],
      seen: json['seen'],
    );
  }

  NotificationModel copyWith({
    String? id,
    String? content,
    bool? seen,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      content: content ?? this.content,
      seen: seen ?? this.seen,
    );
  }
}
