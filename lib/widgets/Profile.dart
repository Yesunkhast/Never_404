import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String title = "Мессеж";
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 225, 225),
      appBar: AppBar(
        title: Text(
          "Yesuu ID Card",
          style: TextStyle(
              color: Color.fromARGB(255, 1, 44, 80),
              fontFamily: "Lemon-Regular"),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/human.jpg'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.black12,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "NAME",
              style: TextStyle(
                color: const Color.fromARGB(255, 7, 50, 85),
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
                // height: 10.0,
                ),
            Text(
              "Yesunkhast",
              style: TextStyle(
                color: Colors.teal,
                letterSpacing: 2.0,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "CURRENT YESUU LEVEL",
              style: TextStyle(
                color: const Color.fromARGB(255, 7, 50, 85),
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
                // height: 10.0,
                ),
            Text(
              "5",
              style: TextStyle(
                color: Colors.teal,
                letterSpacing: 2.0,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.teal,
                ),
                SizedBox(
                  width: 7.0,
                ),
                Text(
                  "@boroonii_xvn",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 7, 50, 85),
                      fontSize: 15.0,
                      letterSpacing: 1.0),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.facebook_outlined,
                  color: Colors.teal,
                ),
                SizedBox(
                  width: 7.0,
                ),
                Text(
                  "Yesunkhast Dorjpurev",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 7, 50, 85),
                      fontSize: 15.0,
                      letterSpacing: 1.0),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                SizedBox(
                  width: 7.0,
                ),
                Text(
                  "esonkhastdorjpurev@gmail.com",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 7, 50, 85),
                      fontSize: 15.0,
                      letterSpacing: 1.0),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                SizedBox(
                  width: 7.0,
                ),
                Text(
                  "94290065",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 7, 50, 85),
                      fontSize: 15.0,
                      letterSpacing: 1.0),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
