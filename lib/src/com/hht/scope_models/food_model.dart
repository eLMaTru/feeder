import 'package:feeder/src/com/hht/models/drink_type.dart';
import 'package:feeder/src/com/hht/models/food.dart';
import 'package:feeder/src/com/hht/service/food_service.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:feeder/src/com/hht/models/general_menu.dart';

mixin GeneralMenuModel on Model {
  List<GeneralMenu> _generalMenuList = [];
  int _generalMenuId;

  int get generalMenuId {
    return _generalMenuId;
  }

  void setGeneralMenuId(int generalMenuId) {
    _generalMenuId = generalMenuId;
  }

  List<GeneralMenu> get generalMenuList {
    return List.from(_generalMenuList);
  }

  void setGeneralMenuList() {
    _generalMenuList = [];
    _generalMenuList.add(GeneralMenu(
        id: 1,
        name: 'BreakFast',
        description: 'In the morning',
        image:
            'assets/images/tmp/empanadasdo.jpeg')); //https://cdn.pixabay.com/photo/2017/05/07/08/56/pancakes-2291908_960_720.jpg
    _generalMenuList.add(GeneralMenu(
        id: 2,
        name: 'Lunch',
        description: 'After 11 AM',
        image:
            'https://cdn.pixabay.com/photo/2018/07/18/19/12/spaghetti-3547078_960_720.jpg'));
    _generalMenuList.add(GeneralMenu(
        id: 3,
        name: 'Dinner',
        description: 'In the Evening',
        image:
            'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'));
    _generalMenuList.add(GeneralMenu(
        id: 4,
        name: 'Dessert',
        description: 'After 11 AM',
        image:
            'https://cdn.pixabay.com/photo/2017/01/11/11/33/cake-1971552_960_720.jpg'));
  }
}

mixin FoodModel on GeneralMenuModel {
  FoodService _foodService = FoodService();
  Food _food;
  DrinkType _drinkType;

  Food get food {
    return _food;
  }

  Food selectedFoodById(int id) {
    _food = foods.firstWhere((f) => f.id == id);
    return _food;
  }

  List<Food> _foods = [];

  List<Food> get foods {
    return List.from(_foods);
  }

  List<Food> getFoodMenuByGeneralMenuId() {
    _foods = _foodService.getFoodMenuByGeneralMenuId(_generalMenuId);
    return List.from(_foods);
  }

  List<DrinkType> getDrinkTypeList() {
    return List.from(_foodService.getDrinkTypeList());
  }


  DrinkType get drinkType {
    notifyListeners();
    return _drinkType;
  }

  void setSelectedDrinkTypeById(String dinkTypeName) {
    _drinkType = _foodService.setSelectedDrinkTypeById(dinkTypeName);
notifyListeners();
 }

 void setSelectedDrinkType(DrinkType drinkType){
   _drinkType = drinkType;
   notifyListeners();
 }
}
