import 'package:chatb/Constant/Constant.dart';
import 'package:chatb/Constant/circleUsersList.dart';
import 'package:chatb/Pages/ChatPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: appBarItems(),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Column(
        children: [
          CircleUsersList(),
          messagesListDesign(size),
        ],
      ),
      floatingActionButton: fabButtonDesign(),
    );
  }

  Widget messagesListDesign(size) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
        },
        child: Container(
          width: size.width * 0.9,
          height: size.height * .66,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SizedBox(
                  height: size.height / 7.5,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: Constant().gray,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        profileCircle(35),
                        SizedBox(
                          width: size.width / 2.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text("Public Chat", style: Constant().mesTitle),
                              ),
                              Text(
                                "Hello",
                                style: Constant().mesSubTitle,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "12:00 PM",
                                style: Constant().mesTime,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 6.0),
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Constant().redOrange,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    "4",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Container fabButtonDesign() {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: Constant().purple,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(24)),
      ),
      child: Center(
        child: Stack(
          children: [
            Positioned(
              left: 6.5,
              top: 6.5,
              child: Icon(
                Icons.message,
                size: 40,
                color: Colors.black54,
              ),
            ),
            Icon(
              Icons.message,
              size: 40,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

// Color.fromRGBO(38, 38, 38, 0.4)
  Row appBarItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green[300],
            border: Border.all(color: Colors.black54, width: 2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("29 Online"),
        )
      ],
    );
  }

  SizedBox peopleList() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Stack(
                  children: [
                    profileCircle(40),
                    greenDot(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Burak",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
