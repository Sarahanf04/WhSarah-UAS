import 'message_model.dart';

class DosenModel {
  final int id;
  final String fullName;
  final String avatar;
  final List<MessageModel> messages;

  DosenModel({
    required this.id,
    required this.fullName,
    required this.avatar,
    required this.messages,
  });

  factory DosenModel.fromJson(Map<String, dynamic> json) {
  final id = json['id'];
  final fullName = json['fullName'] ?? '';
  final avatar = json['avatar'] ?? '';

  final messages = (json['messages'] as List? ?? []).map((msg) {
    return MessageModel.fromJson({
      'from': (msg['role'] == 'dosen') ? 0 : 1,
      'message': msg['message'] ?? '',
      'isRead': false,
    });
  }).toList();

  return DosenModel(
    id: id ?? 0,
    fullName: fullName,
    avatar: avatar,
    messages: messages,
  );
}


 Map<String, dynamic> toJson() => {
  'id': id,
  'name': fullName,
  'img': avatar,
  'details': messages.map((msg) {
    return {
      'role': msg.from == 0 ? 'dosen' : 'saya',
      'message': msg.message,
    };
  }).toList(),
};
}