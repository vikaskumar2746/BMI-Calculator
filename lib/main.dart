import 'package:bmi_calculator/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bmi',
      home:SplashScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  var wtController = TextEditingController();
  var htController = TextEditingController();
  var bgColor = Colors.yellow.shade200;
  var result = "";
  var status = '';
  var res = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Container(
        width: double.infinity,
        color: bgColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Check your body mass index : ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Center(
                child: SizedBox(
                  width: 255,
                  child: TextField(
                    controller: wtController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]*\.?[0-9]*'),
                      ),
                    ],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.line_weight),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          topRight: Radius.circular(36),
                        ),
                      ),
                      label: Text('Enter your weight (in kg):  '),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: SizedBox(
                  width: 255,
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]*\.?[0-9]*'),
                      ),
                    ],
                    controller: htController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.height),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          topRight: Radius.circular(36),
                        ),
                      ),
                      label: Text('Enter your height(in cm):'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 40),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  side: const BorderSide(color: Colors.blue, width: 1),
                ),

                onPressed: () {
                  var wt = double.tryParse(wtController.text);
                  var ht = double.tryParse(htController.text);
                  if (wt != null && ht != null && ht > 0) {
                    double htInMeter = ht / 100;
                    res = (wt / (htInMeter * htInMeter)).toStringAsFixed(2);
                    result = 'Your Bmi is : $res';
                    if (double.parse(res) < 18.5) {
                      status = "UnderWeight";
                      bgColor = Colors.red.shade200;
                    } else if (double.parse(res) >= 18.5 &&
                        double.parse(res) < 25) {
                      status = " Normal";
                      bgColor = Colors.tealAccent;
                    } else if (double.parse(res) >= 25 &&
                        double.parse(res) < 30) {
                      status = 'overweight ';
                      bgColor = Colors.lightGreenAccent;
                    } else {
                      status = "Obese";
                      bgColor = Colors.red.shade400;
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please  enter all values ',
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                  setState(() {});
                },
                child: Text('Calculate'),
              ),
              SizedBox(height: 20),
              Text(
                status,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 15),
              Text(
                result,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
