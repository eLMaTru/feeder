import 'package:flutter/material.dart';


class Food {
  final int id;
   final String name;
  final String description;
  final double price;
  final int generalMenuId;
  final String image; 


  Food({@required this.id, @required this.name, @required this.description, @required this.price, @required this.image, @required this.generalMenuId});
}