import 'package:flutter/material.dart';
import 'package:intro_to_material_design/firebase_authentication/home_page.dart';
import 'package:intro_to_material_design/firebase_authentication/signup_page.dart';

import 'authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        backgroundColor: Color(0xff10223d),
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: TextFormField(
                cursorColor: Colors.white,
                //textInputAction: TextInputType.emailAddress,
                autofocus: false,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Please enter your email..',
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
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: TextFormField(
                cursorColor: Colors.white,
                //textInputAction: TextInputType.emailAddress,
                autofocus: false,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Please enter your password..',
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
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Container(
              width: 320,
              child: ElevatedButton(
                onPressed: () {
                  var email = emailController.text.toString();
                  var pwd = passwordController.text.toString();
                  AuthenticationHelper()
                      .signIn(email: email, password: pwd)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    }
                  });
                },
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff2b3c5a),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text(
                  "Don't have account, Create here",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
