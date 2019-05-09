import 'package:feeder/src/com/hht/scope_models/main_model.dart';
import 'package:feeder/src/com/hht/views/auth/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(FeederApp());
}

class FeederApp extends StatelessWidget {
 final MainModel _model = MainModel();
  @override
  Widget build(BuildContext context) {
    
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        title: 'Feeder',
        theme: ThemeData(
            primarySwatch: Colors.green, accentColor: Colors.deepOrange),
        routes: {
          '/': (BuildContext context) => AuthView(),
        },
      ),
    );
  }
}
