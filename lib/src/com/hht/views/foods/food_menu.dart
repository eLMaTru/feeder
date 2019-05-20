import 'package:feeder/src/com/hht/models/drink_type.dart';
import 'package:feeder/src/com/hht/models/food.dart';
import 'package:feeder/src/com/hht/scope_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class FoodMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back Button Pressed');
        Navigator.popAndPushNamed(context, '/home');

        return Future.value(true);
      },
      child: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget chil, MainModel model) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Menu'),
            ),
            body: _buildFoodMenuCard(model, context),
          );
        },
      ),
    );
  }

  Widget _buildFoodMenuCard(MainModel model, BuildContext context) {
    final List<Food> foods = model.getFoodMenuByGeneralMenuId();

    Widget generalMenuCard;
    if (foods.length > 0) {
      generalMenuCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            _buildCard(foods[index], index, model, context),
        itemCount: foods.length,
      );
    } else {
      generalMenuCard = Center(
        child: Text("No Products found, please add some"),
      );
    }

    return generalMenuCard;
  }

  Widget _buildCard(
      Food food, int index, MainModel model, BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Column(
        children: <Widget>[
          FadeInImage(
            height: 200.0,
            width: 400.0,
            fit: BoxFit.cover,
            image:  AssetImage(food.image),
            placeholder: AssetImage('assets/images/food-platter_1280.jpg'),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                food.name,
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("\$${food.price.toString()}"),
            ],
          )),
          SizedBox(
            height: 10.0,
          ),
          Text(food.description),
           SizedBox(
            height: 5.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme( buttonColor: Theme.of(context).accentColor,
                  minWidth: 300.0,
                  height: 50.0,
                  child: RaisedButton( 
                    onPressed: () {
                      model.selectedFoodById(food.id);
                    //  model.setSelectedDrinkType(DrinkType(id: BigInt.from(0), name: ''));
                      Navigator.pushNamed(context, "/createOrder");
                      },
                    child: Text("\Initial order", style: TextStyle(fontSize: 20.0),),
                  ),
                ),
              
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
