import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const Roger_app());
}

class Roger_app extends StatelessWidget {
  const Roger_app({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainBmi(title: 'Roger App'),
    );
  }
}

class MainBmi extends StatefulWidget {
  const MainBmi({super.key, required this.title});
  final String title;

  @override
  State<MainBmi> createState() => _MainBmiState();
}

class _MainBmiState extends State<MainBmi> {
  TextEditingController nameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String message = "";
  String name = "";

  double? dw, dh, bmi;

  void get_it() {
    setState(() {
      name = nameController.text;
      dw = double.parse(weightController.text);
      dh = double.parse(heightController.text);
      bmi = dw! / (dh! * dh!);
      message = "Your name is $name , Height : $dh, Weight : $dw , BMI : $bmi";
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Roger_app2(
                  message: message,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Hello BMI Calculator",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "Enter Your Name",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: heightController,
                  decoration: InputDecoration(
                      labelText: "Enter Your Height",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: weightController,
                  decoration: InputDecoration(
                      labelText: "Enter Your Weight",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: get_it,
                  child:
                      Text("Submit Bmi", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          )),
    );
  }
}

class Roger_app2 extends StatelessWidget {
  final String message;
  const Roger_app2({required this.message});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(" $message"),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Go Back",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
