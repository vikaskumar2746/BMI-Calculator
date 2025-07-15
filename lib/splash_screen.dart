import 'dart:async';

import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => SplashScreenState();
}
  class SplashScreenState extends State<SplashScreen>{
@override
  void initState() {
   super.initState();
   Timer(Duration(seconds: 2),(){
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
   {
     return HomeScreen();
   })
      );

   }
   );
}
@override
  // TODO: implement context
Widget build(BuildContext context){
  return Scaffold(
    body: Container(
      height: MediaQuery.of(context).size.height,
     width: MediaQuery.of(context).size.width,
     decoration: BoxDecoration(
       gradient: LinearGradient(colors: [Colors.teal,Colors.orange],
           begin: Alignment.topLeft,
         end: Alignment.bottomRight
       ),

     ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text('BMI Calculator ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Text('Developed By Vikas Kumar !!!',style: TextStyle(fontSize: 16),),
          )
        ],
      ),
    ),
  );
}
}
