import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InputAndSelectionsPage extends StatefulWidget {
  const InputAndSelectionsPage({Key? key}) : super(key: key);

  @override
  _InputAndSelectionsPageState createState() => _InputAndSelectionsPageState();
}
enum SingleCharacter{Radio1}

class _InputAndSelectionsPageState extends State<InputAndSelectionsPage> {
  bool checkValue = false;
  SingleCharacter? _char = SingleCharacter.Radio1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input And Selection"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your Name',
              ),
            ),

            SizedBox(height: 20,),

            Checkbox(value: checkValue, onChanged: (bool? value){
             checkValue = value!;
             setState(() {
               if(checkValue){
                 Fluttertoast.showToast(msg: "Checkbox Checked..",toastLength: Toast.LENGTH_SHORT);
               }else{
                 Fluttertoast.showToast(msg: "Checkbox UnChecked..",toastLength: Toast.LENGTH_SHORT);
               }
             });
            }),

            SizedBox(height: 20,),

            ListTile(
              title: Text('Radio 1'),
              leading: Radio<SingleCharacter>(
                value: SingleCharacter.Radio1,
                groupValue: _char,
                onChanged: (SingleCharacter ? value){
                  setState(() {
                    _char = value;
                  });
                },
              ),
            )



          ],
        ),
      ),
    );
  }
}
