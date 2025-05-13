class MessageModel {
  final String id;
  final String content;
  final bool isSender; 
  final bool seen;
  final DateTime timestamp;

  MessageModel({
    required this.id,
    required this.content,
    required this.isSender,
    required this.seen,
    required this.timestamp,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['_id'],
      content: json['content'],
      isSender: !json['received'],
      seen: json['seen'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'content': content,
      'received': !isSender,
      'seen': seen,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
