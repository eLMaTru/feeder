import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthView();
  }
}

class _AuthView extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feeder'),//
      ),
    );
  }
}
