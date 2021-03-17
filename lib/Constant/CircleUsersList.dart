import 'package:flutter/material.dart';

class CircleUsersList extends StatefulWidget {
  @override
  _CircleUsersListState createState() => _CircleUsersListState();
}

class _CircleUsersListState extends State<CircleUsersList> {
  @override
  Widget build(BuildContext context) {
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

CircleAvatar profileCircle(double size) {
  var url =
      "https://avatars.githubusercontent.com/u/70351342?s=460&u=e67134a90ef86bb49462916d758f6beaa19ec78b&v=4";
  return CircleAvatar(
    radius: size,
    backgroundImage: NetworkImage(url),
  );
}

Positioned greenDot() {
  return Positioned(
    left: 50,
    top: 0.1,
    child: Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
        border: Border.all(color: Colors.black, width: 6),
      ),
    ),
  );
}
