import 'package:chatb/Models/Message.dart';
import 'package:chatb/Models/User.dart';

class Room {
  String? key;
  String? name;
  String? image;
  DateTime? time;
  String? description;
  List<User>? usersList;
  List<Message>? messagesList;
  List<User>? adminUserList;
  int? isNewMessage;
  Room({
    this.key,
    this.name,
    this.image,
    this.time,
    this.description,
    this.usersList,
    this.messagesList,
    this.adminUserList,
    this.isNewMessage,
  });
}
