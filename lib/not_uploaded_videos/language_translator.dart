import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslatorApp extends StatefulWidget {
  const LanguageTranslatorApp({Key? key}) : super(key: key);

  @override
  _LanguageTranslatorAppState createState() => _LanguageTranslatorAppState();
}

class _LanguageTranslatorAppState extends State<LanguageTranslatorApp> {
  TextEditingController languageController = TextEditingController();
  var languages = ['Hindi', 'English', 'Marathi'];
  var originLanguage = "From";
  var destinationLanguage = "To";
  var output = "";

  void translate(String src, String dest, String input) async {
    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(input, from: 'en', to: 'hi');
    setState(() {
      output = translation.text.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        title: Text("Language Translator"),
        centerTitle: true,
        backgroundColor: const Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  focusColor: Colors.white,
                  iconDisabledColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  hint: Text(
                    originLanguage,
                    style: TextStyle(color: Colors.white),
                  ),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: languages.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      originLanguage = value!;
                    });
                  },
                ),
                SizedBox(
                  width: 40,
                ),
                Icon(
                  Icons.arrow_right_alt_outlined,
                  color: Colors.white,
                  size: 40.0,
                ),
                SizedBox(
                  width: 40,
                ),
                DropdownButton(
                  focusColor: Colors.white,
                  iconDisabledColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  hint: Text(
                    destinationLanguage,
                    style: TextStyle(color: Colors.white),
                  ),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: languages.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      destinationLanguage = value!;
                    });
                  },
                ),
              ],
            ),

            SizedBox(
              height: 40,
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Colors.white,
                autofocus: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Please enter your text..',
                  labelStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0)),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                ),
                controller: languageController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Task Name';
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff2b3c5a),
                  ),
                  onPressed: () {
                    translate('en', 'hi', languageController.text.toString());
                  },
                  child: Text("Translate")),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "\n$output",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
