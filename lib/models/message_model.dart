class MessageModel {
  final int from; // 0 = dosen, 1 = user
  final String message;
  bool isRead; // baru, default false

  MessageModel({
    required this.from,
    required this.message,
    this.isRead = false,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
  from: json['from'] ?? 0,  // default 0 kalau null
  message: json['message'] ?? '', // default string kosong kalau null
  isRead: json['isRead'] ?? false,
);


  Map<String, dynamic> toJson() => {
    'from': from,
    'message': message,
    'isRead': isRead,
  };
}
