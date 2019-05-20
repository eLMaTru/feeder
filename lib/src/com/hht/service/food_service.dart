import 'package:feeder/src/com/hht/models/drink_type.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/endpoints.dart';
import '../models/user.dart';

import 'package:feeder/src/com/hht/models/food.dart';

class FoodService {
  List<Food> _foodMenu = [];
  List<DrinkType> _drinkTypes = [];
  DrinkType _drinkType = DrinkType(id: BigInt.from(0), name: '');


  List<Food> getFoodMenuByGeneralMenuId(int generalMenuId) {
    _foodMenu = [];

    _foodMenu.add(Food(
        id: 1,
        name: "La Bandera",
        description: "Arroz Abichuela y Carne de Pollo",
        price: 125.0,
        generalMenuId: generalMenuId,
        image: "assets/images/tmp/arroz-abichuela-carne.jpg"));

    _foodMenu.add(Food(
        id: 2,
        name: "Locrio de Pollo",
        description: "El Pollo en el Arroz con ensalada verde",
        price: 125.0,
        generalMenuId: generalMenuId,
        image: "assets/images/tmp/locrio.jpg"));

    _foodMenu.add(Food(
        id: 3,
        name: "Moro de guandule",
        description: "Arroz con guandules y carne",
        price: 125.0,
        generalMenuId: generalMenuId,
        image: "assets/images/tmp/moroguandule.jpg"));

    return _foodMenu;
  }

  List<DrinkType> get drinkTypes {
    return List.from(_drinkTypes);
  }

  DrinkType get drinkType {
    return _drinkType;
  }

  DrinkType setSelectedDrinkTypeById(String dinkTypeName) {
    _drinkType = _drinkTypes.firstWhere((dt) => dt.name == dinkTypeName);
  return _drinkType;
  }

  List<DrinkType> getDrinkTypeList() {
    _drinkTypes = [];

    _drinkTypes.add(DrinkType(
        id: BigInt.from(1), name: "Agua", description: "Una Botella de Agua"));
    _drinkTypes.add(DrinkType(
        id: BigInt.from(2),
        name: "Cola Real",
        description: "Una Botella de Refresco"));
    _drinkTypes.add(DrinkType(
        id: BigInt.from(3),
        name: "Jugo Limon",
        description: "Una Botella de Jugo de Limon"));

    return List.from(_drinkTypes);
  }
}
