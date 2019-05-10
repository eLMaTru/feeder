import 'package:feeder/src/com/hht/models/general_menu.dart';
import 'package:scoped_model/scoped_model.dart';

mixin GeneralMenuModel on Model{
  List<GeneralMenu> _generalMenuList = [];


  List<GeneralMenu> get generalMenuList{
      return List.from(_generalMenuList);
  }


  void  setGeneralMenuList(){
   _generalMenuList = [];
   _generalMenuList.add(GeneralMenu(id: 1, name: 'BreakFast', description: 'In the morning', image: 'https://cdn.pixabay.com/photo/2017/05/07/08/56/pancakes-2291908_960_720.jpg'));
   _generalMenuList.add(GeneralMenu(id: 1, name: 'Lunch', description: 'After 11 AM', image: 'https://cdn.pixabay.com/photo/2018/07/18/19/12/spaghetti-3547078_960_720.jpg'));
   _generalMenuList.add(GeneralMenu(id: 1, name: 'Dinner', description: 'In the Evening', image: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'));
   _generalMenuList.add(GeneralMenu(id: 1, name: 'Dessert', description: 'After 11 AM', image: 'https://cdn.pixabay.com/photo/2017/01/11/11/33/cake-1971552_960_720.jpg'));


  }





}