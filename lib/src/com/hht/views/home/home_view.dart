import 'package:feeder/src/com/hht/scope_models/main_model.dart';
import 'package:feeder/src/com/hht/views/home/general_info.dart';

import 'package:feeder/src/com/hht/views/home/general_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Options'),
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(title: Text('Feeder'), 
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Foods',
                icon: Icon(Icons.fastfood),
              ),
              Tab(icon: Icon(Icons.info),
                text: 'Info',
              )
            ],
          ),),
          body: TabBarView(children: <Widget>[
             GeneralMenuView(),
             GeneralInfo()
        ],),
        ),
      );
    });
  }

 
}
