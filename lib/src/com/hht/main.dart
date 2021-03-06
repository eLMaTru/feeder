import 'package:feeder/src/com/hht/scope_models/main_model.dart';
import 'package:feeder/src/com/hht/views/auth/auth_view.dart';

import 'package:feeder/src/com/hht/views/foods/create_order.dart';
import 'package:feeder/src/com/hht/views/foods/food_menu.dart';
import 'package:feeder/src/com/hht/views/home/home_view.dart';


import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(FeederApp());
}

class FeederApp extends StatelessWidget{

 
 final MainModel _model = MainModel();
  @override
  Widget build(BuildContext context) {
    
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        title: 'Feeder',
        theme: ThemeData(
            primarySwatch: Colors.green, accentColor: Colors.deepOrange, brightness: Brightness.dark),
        routes: {
          '/': (BuildContext context) => AuthView(),
           '/home': (BuildContext context) => HomeView(),
           '/foodMenu': (BuildContext context) => FoodMenu(),
           '/createOrder': (BuildContext context) => CreateOrder(),
        },
      ),
    );
  }
}
