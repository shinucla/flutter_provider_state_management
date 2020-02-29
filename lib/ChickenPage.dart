import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_provider_state_management/model/ChickenModel.dart';

class ChickenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChickenModel>(
      builder: (context, chickenModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Chicken")
          ),
          body: Center(
            child: Text("Chicken Number ${chickenModel.number}.")
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home')),
              BottomNavigationBarItem(
                icon: Icon(Icons.remove),
                title: Text('-')),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                title: Text('+')),
            ],
            onTap: (index) {
              switch (index) {
                case 0: _home(context); break;
                case 1: _sub(chickenModel); break;
                case 2: _add(chickenModel); break;
              }
            }
          ) // bottomnavigationbaritem
        ); // Scaffold
      }
    ); // Consumer
  }

  _home(context) {
    Navigator.pop(context);
  }

  _add(model) {
    //var model = Provider.of<ChickenModel>(context);
    model.add();
  }

  _sub(model) {
    //var model = Provider.of<ChickenModel>(context);
    model.sub();
  }
}
