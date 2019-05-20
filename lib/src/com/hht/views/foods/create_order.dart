import 'package:feeder/src/com/hht/models/drink_type.dart';
import 'package:feeder/src/com/hht/models/food.dart';
import 'package:feeder/src/com/hht/scope_models/main_model.dart';
import 'package:feeder/src/com/hht/utils/utils_color.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CreateOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CreateOrder();
  }
}

class _CreateOrder extends State<CreateOrder> {
  final GlobalKey<FormState> _formkKey = GlobalKey<FormState>();

  DrinkType _seletedDrink;
  List<DrinkType> _drinkTypes = [];

  @override
  void initState() {
    // TODO: implement initState
    // drinkTypes = model.getDrinkTypeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget chill, MainModel model) {
      Widget content = Container();
      content = Scaffold(
        appBar: AppBar(
          title: Text('Make Order'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Form(
                key: _formkKey,
                child: _buildOrderForm(context, model),
              ),
            ),
          ],
        ),
      );

      return content;
    });
  }

  Widget _buildOrderForm(context, model) {
    Food food = model.food;
    _drinkTypes = model.getDrinkTypeList();
    return Column(
      children: <Widget>[
        FadeInImage(
          height: 240.0,
          fit: BoxFit.cover,
          image: AssetImage(food.image),
          placeholder: AssetImage('assets/images/food-platter_1280.jpg'),
        ),
        Center(child: Text(food.name + ": "+ food.description),),
       Divider(),
       
        Container(
          child: _buildDrinkTypeMenu(model),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          child: _buildEnsaladaTypeMenu(model),
        ),
        buildNoteField(),
      ],
    );
  }

//build drop down menu
  Widget _buildDrinkTypeMenu(MainModel model) {
    List<DropdownMenuItem<String>> list = [];
    _drinkTypes.map((DrinkType value) {
      list.add(
        DropdownMenuItem<String>(
          value: value.name,
          child: new Text(value.name),
        ),
      );
    }).toList();

    return Container(
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8.0),
          //labelText: 'select drink',
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text("Select Drink"),
            onChanged: (String newValue) {
              setState(() {
                print(newValue);
                model.setSelectedDrinkTypeById(newValue);
              });
            },
            items: list,
            value: model.drinkType == null ? null : model.drinkType.name,
          ),
        ),
      ),
    );
  }

  Widget _buildEnsaladaTypeMenu(MainModel model) {
    String val;
    Widget content = Container();

    content = InputDecorator(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8.0),
        //labelText: 'select drink',
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text("Select Salad"),
          value: model.drinkTypeValue,
          isDense: true,
          onChanged: (String newValue) {
            setState(() {
              model.setDrinkTypeValue(newValue);
            });
          },
          items: ['Rusa', 'Codito', 'Aguacate', 'Verde'].map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );

    return content;
  }

//build text area to note
  Widget buildNoteField() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          labelText: "Nota",
        ),
        onSaved: (String value) {
          print(value);
        },
        validator: (String valueToValidate) {
          print(valueToValidate);
        },
      ),
    );
  }
}
