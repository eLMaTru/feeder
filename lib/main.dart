import 'package:feeder/src/views/auth/auth_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FeederApp());
}

class FeederApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Feeder',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.deepOrange
      ),
      routes: {
          '/': (BuildContext context) => AuthView(),
          
        },
    );
  }
}
