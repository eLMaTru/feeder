import 'package:scoped_model/scoped_model.dart';
import './user_model.dart';
import './food_model.dart';

class MainModel extends Model with UserModel, GeneralMenuModel, FoodModel {}
