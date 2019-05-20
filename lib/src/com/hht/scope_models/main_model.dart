import 'package:scoped_model/scoped_model.dart';
import './user_model.dart';
import './food_model.dart';

class MainModel extends Model with UserModel, GeneralMenuModel, FoodModel {
  String _drinkTypeValue;

  String get drinkTypeValue{

    return _drinkTypeValue;
  }

  String seletedTypeValue(){
    return _drinkTypeValue;
  }

  void setDrinkTypeValue(String newValue){
     _drinkTypeValue = newValue;
  }
}
