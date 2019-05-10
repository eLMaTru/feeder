import 'package:feeder/src/com/hht/scope_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:feeder/src/com/hht/models/general_menu.dart';



class GeneralMenuView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget chil, MainModel model){
     
     
              return _buildGeneralMenuCard(model, context);
    }); 
  }


  Widget _buildGeneralMenuCard( MainModel model, BuildContext context){
    model.setGeneralMenuList();
   List<GeneralMenu> generalMenuList = model.generalMenuList;
   
    Widget generalMenuCard;
    if (generalMenuList.length > 0) {
      generalMenuCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            _buildCard(generalMenuList[index], index, model , context),
        itemCount: generalMenuList.length,
      );
    } else {
      generalMenuCard = Center(
        child: Text("No Products found, please add some"),
      );
     
    }

    return generalMenuCard;
  }
  

  Widget _buildCard(GeneralMenu generalMenu, int index, model , BuildContext context){

   return Card(
          child: Column(
            children: <Widget>[
              FadeInImage(height: 300.0,
              fit: BoxFit.cover,
                image: NetworkImage(generalMenu.image),
                placeholder: AssetImage('assets/images/food-platter_1280.jpg'),
              ),

              //SizedBox(height: 10.0,),
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
              ),
              
             
              
                 
                ],
              )
            
          
       
    );
  }


}