import 'package:flutter/material.dart';

class LayoutsPage extends StatefulWidget {
  const LayoutsPage({Key? key}) : super(key: key);

  @override
  _LayoutsPageState createState() => _LayoutsPageState();
}

class _LayoutsPageState extends State<LayoutsPage> {
  int stepIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layouts"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: ListTile(
                leading: FlutterLogo(),
                title: Text("List Tile Widget"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Stepper(
              currentStep: stepIndex,
              onStepCancel: () {
                if (stepIndex > 0) {
                  setState(() {
                    stepIndex -= 1;
                  });
                }
              },
              onStepContinue: () {
                if (stepIndex <= 0) {
                  setState(() {
                    stepIndex += 1;
                  });
                }
              },
              onStepTapped: (int index) {
                setState(() {
                  stepIndex = index;
                });
              },
              steps: <Step>[
                Step(
                  title: Text("Step 1 "),
                  content: Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Welcome to Geeks for Geeks"),
                  ),
                ),
                const Step(
                  title: Text("Step 2 "),
                  content: Text(
                      "Here you can get to learn about Computer Science."),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
