import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  displayMessage(message) {
    Fluttertoast.showToast(
        msg: message + " Clicked..", toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Demo"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
                child: Center(
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("Message"),
              onTap: () {
                displayMessage("Message");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Profile"),
              onTap: () {
                displayMessage("Profile");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                displayMessage("Settings");
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Text("Welcome to Geeks for Geeks"),
      ),
    );
  }
}
