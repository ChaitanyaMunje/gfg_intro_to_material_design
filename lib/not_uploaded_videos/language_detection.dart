import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_identification/flutter_language_identification.dart';

class LanguageDetectionPage extends StatefulWidget {
  const LanguageDetectionPage({Key? key}) : super(key: key);

  @override
  _LanguageDetectionPageState createState() => _LanguageDetectionPageState();
}

class _LanguageDetectionPageState extends State<LanguageDetectionPage> {
  late FlutterLanguageIdentification languageIdentification;
  late String _text;
  dynamic _result = '';
  TextEditingController inputTxt = TextEditingController();

  @override
  void initState() {
    super.initState();
    initLanguageIdentification();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initLanguageIdentification() async {
    languageIdentification = FlutterLanguageIdentification();

    languageIdentification.setSuccessHandler((message) {
      setState(() {
        print(message);
        _result = message;
      });
    });

    languageIdentification.setErrorHandler((message) {
      setState(() {
        print(message);
      });
    });

    languageIdentification.setFailedHandler((message) {
      setState(() {
        print(message);
        _result = message;
      });
    });
  }

  Future _identifyLanguage() async {
    if (_text != null && _text.isNotEmpty) {
      await languageIdentification.identifyLanguage(_text);
    }
  }

  void _onChange(String text) {
    setState(() {
      _text = text;
    });
  }

  String getLanguage(String code) {
    if (code == "ar") {
      return "Arabic";
    } else if (code == "en") {
      return "English";
    } else if (code == "hi") {
      return "Hindi";
    }
    return "Language Not Found";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff10223d),
        appBar: AppBar(
          title: Text('Flutter Language Detection'),
          elevation: 0,
          backgroundColor: const Color(0xff10223d),
          centerTitle: true,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: TextFormField(
                cursorColor: Colors.white,
                //textInputAction: TextInputType.emailAddress,
                autofocus: false,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Please enter your text to detect language',
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
                controller: inputTxt,
                onChanged: (String value) {
                  _onChange(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your text';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 320,
              child: ElevatedButton(
                onPressed: _identifyLanguage,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Detect Language"),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff2b3c5a),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              _result.toString().isEmpty
                  ? "Please enter your text"
                  : getLanguage(_result.toString()),
              //getLanguage(_result.toString()),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ]),
        ));
  }
}
