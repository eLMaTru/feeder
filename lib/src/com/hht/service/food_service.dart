import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/endpoints.dart';
import '../models/user.dart';

import 'package:feeder/src/com/hht/models/food.dart';

class FoodService {
 List<Food> _foodMenu = [];

List<Food> getFoodMenuByGeneralMenuId(int generalMenuId){
 _foodMenu = [];

 
 _foodMenu.add(Food(id: 1, name: "La Bandera", description: "Arroz Abichuela y Carne de Pollo", price: 125.0, generalMenuId: generalMenuId, image: "assets/images/tmp/arroz-abichuela-carne.jpg"));

 _foodMenu.add(Food(id: 1, name: "Locrio de Pollo", description: "El Pollo en el Arroz con ensalada verde", price: 125.0, generalMenuId: generalMenuId, image: "assets/images/tmp/locrio.jpg"));

 _foodMenu.add(Food(id: 1, name: "Moro de guandule", description: "Arroz con guandules y carne", price: 125.0, generalMenuId: generalMenuId, image: "assets/images/tmp/moroguandule.jpg"));


  return _foodMenu;
}

}