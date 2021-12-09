import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogAndAlertPage extends StatefulWidget {
  const DialogAndAlertPage({Key? key}) : super(key: key);

  @override
  _DialogAndAlertPageState createState() => _DialogAndAlertPageState();
}

class _DialogAndAlertPageState extends State<DialogAndAlertPage> {
  void showBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        elevation: 10,
        builder: (ctx) => Container(
              width: 300,
              height: 250,
              color: Colors.white54,
              alignment: Alignment.center,
              child: Text(
                "Welcome to Geeks for Geeks",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ));
  }

  Future<void> showAlertDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert Dialog'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Welcome to Geeks for Geeks"),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialogs and Alerts"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  showAlertDialog();
                },
                child: Text("Display Alert Dialog")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  showBottomSheet(context);
                },
                child: Text("Display Bottom Sheet Dialog")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Snackbar displayed.."),
                    action: SnackBarAction(
                        label: 'Actions',
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg: "Action Clicked",
                              toastLength: Toast.LENGTH_SHORT);
                        }),
                  ));
                },
                child: Text("Display Snackbar")),
          ],
        ),
      ),
    );
  }
}
