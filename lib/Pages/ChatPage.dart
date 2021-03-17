import 'package:chatb/Constant/CircleUsersList.dart';
import 'package:chatb/Constant/Constant.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 50,
            color: Colors.white60,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(children: [
          CircleUsersList(),
          messagesList(size),
          chatTextField(),
        ]),
      ),
    );
  }

  Padding chatTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: TextField(
        style: TextStyle(color: Colors.white54),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 26, horizontal: 35),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constant().purple,
                ),
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
            hintText: "Type a message...",
            hintStyle: TextStyle(color: Colors.white54),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            filled: true,
            fillColor: Color.fromRGBO(46, 45, 47, 1)),
      ),
    );
  }

  Widget messagesList(size) {
    return Expanded(
      child: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, i) {
          return Column(
            children: [
              Column(
                children: [
                  Align(
                    alignment: i % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
                    child: Padding(
                      padding:
                          i % 2 == 0 ? EdgeInsets.only(left: 8.0) : EdgeInsets.only(right: 8.0),
                      child: Text("09:24AM", style: Constant().mesTime),
                    ),
                  ),
                  Align(
                    alignment: i % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(i % 2 == 0 ? 0 : 30),
                          topRight: Radius.circular(i % 2 == 0 ? 30 : 0),
                          bottomLeft: Radius.circular(i % 2 == 0 ? 30 : 30),
                          bottomRight: Radius.circular(i % 2 == 0 ? 30 : 30),
                        ),
                      ),
                      color: i % 2 == 0 ? Constant().redOrange : Constant().purple,
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(
                          "Mesaj $i",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
