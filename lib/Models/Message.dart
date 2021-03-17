import 'package:chatb/Models/User.dart';

class Message {
  String? key;
  String data;
  DateTime? time;
  String? photo;
  bool? isSeen;
  User from;
  Message({
    this.key,
    required this.data,
    this.time,
    this.photo,
    this.isSeen,
    required this.from,
  });
}
