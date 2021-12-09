import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  displayMessage(message) {
    Fluttertoast.showToast(
        msg: message + " Clicked..", toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          displayMessage("Floating Action Button");
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  displayMessage("Elevated Button");
                },
                child: Text("Elevated Button")),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  displayMessage("Text Button");
                },
                child: Text("Text Button"))
          ],
        ),
      ),
    );
  }
}
