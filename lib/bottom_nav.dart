import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int selectedIndex = 0;
  static const TextStyle textStyle = TextStyle(fontSize: 30,fontWeight: FontWeight.bold);
  static const List<Widget> widgetOptions = <Widget>[

    Text("Home",style: textStyle,),
    Text("Learn",style: textStyle,),
    Text("Contact",style: textStyle,),
  ];

  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sample Appbar'),actions: [
        IconButton(onPressed: (){
          Fluttertoast.showToast(msg: "Notification Clicked..",toastLength: Toast.LENGTH_SHORT);
        }, icon: Icon(Icons.doorbell_rounded)),

      ],),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book),label: 'Learn'),
          BottomNavigationBarItem(icon: Icon(Icons.phone),label: 'Contact Us'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: onItemTapped,
      ),
    );
  }
}
