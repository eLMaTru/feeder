import 'package:feeder/src/com/hht/scope_models/main_model.dart';
import 'package:feeder/src/com/hht/utils/utils_color.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:feeder/src/com/hht/models/general_menu.dart';



class GeneralMenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget chil, MainModel model) {
      return _buildGeneralMenuCard(model, context);
    });
  }

  Widget _buildGeneralMenuCard(MainModel model, BuildContext context) {
    model.setGeneralMenuList();
    List<GeneralMenu> generalMenuList = model.generalMenuList;

    Widget generalMenuCard;
    if (generalMenuList.length > 0) {
      generalMenuCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
               _buildCard(generalMenuList[index], index, model, context),
        itemCount: generalMenuList.length,
      );
    } else {
      generalMenuCard = Center(
        child: Text("No Products found, please add some"),
      );
    }

    return generalMenuCard;
  }

  Widget _buildCard(
      GeneralMenu generalMenu, int index, model, BuildContext context) {
    return/* AbsorbPointer(absorbing: index == 0 ? true : false, child: */GestureDetector(
      onTap: () {

       model.setGeneralMenuId(index);
       Navigator.pushNamed(context, '/foodMenu');
      },
      child:  Card(
        elevation: 5.0,
        child: Column(
          children: <Widget>[
                FadeInImage(
          height: 100.0,
          width: 400.0,
          fit: BoxFit.cover,
          image: generalMenu.id == 1 ? AssetImage(generalMenu.image) : NetworkImage(generalMenu.image),
          placeholder: AssetImage('assets/images/food-platter_1280.jpg'),
        ), 
            Container(
              width: 400.0,
              color: _buildBackGroundColor(index),
              child: Center(
                child: Text(
                  generalMenu.name,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            
       
      /*   SizedBox(
          height: 10.0,
        ), 
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(generalMenu.name),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(generalMenu.description),
                
                ],
              ),
            ), */
          

          ],
        ),
      ),
    );
  }

  Color _buildBackGroundColor(int index) {
    Color color;

    switch (index) {
      case 0:
        color = Color(UColor.EMBER);
        break;
      case 1:
        color = Color(UColor.ORANGE);
        break;
      case 2:
        color = Color(UColor.RED);
        break;
      case 3:
        color = Color(UColor.PURPLE);
        break;
      default:
        color = Color(UColor.BLUE);
    }

    return color;
  }
}
