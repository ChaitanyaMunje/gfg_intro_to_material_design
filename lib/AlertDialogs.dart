import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AlertDialogPage extends StatefulWidget {
  const AlertDialogPage({Key? key}) : super(key: key);

  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {

  Future<void> showAlertDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
            title: Text(
              'Simple Alert Dialog',
              style: TextStyle(color: Colors.white),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                    "Welcome to Geeks for Geeks",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "OK",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Alert Dialogs"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  showAlertDialog();
                },
                child: Text("Display Simple Alert Dialog")),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DisplayAdvanceCustomAlertDialog();
                      });
                },
                child: Text("Display Custom Alert Dialog"))
          ],
        ),
      ),
    );
  }
}

class DisplayAdvanceCustomAlertDialog extends StatelessWidget {
  const DisplayAdvanceCustomAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[800],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 180,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 70, 10, 10),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 8,
                  // ),
                  Text(
                    "Welcome to Geeks for Geeks",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Color(0xff2f8d46)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
          Positioned(
              top: -60,
              child: CircleAvatar(
                backgroundColor: Color(0xff2f8d46),
                radius: 50,
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjCKpx2s5rvmg1lP4PHRr0IKeq9-ttI0IQe1L1gw2mdG0-RDpZvniwxvE&s=10",
                  height: 70,
                  width: 70,
                ),
              ))
        ],
      ),
    );
  }
}
