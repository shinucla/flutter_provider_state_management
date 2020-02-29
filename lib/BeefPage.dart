import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_provider_state_management/model/BeefModel.dart';

/*
* put the consumer in as deep as possible
*/
class BeefPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beef")
      ),
      body: Center(
        child: Consumer<BeefModel>(
          builder: (context, beefModel, child) {
            return Text("Beef Number ${beefModel.number}.");
          }
        )
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
            case 1: _sub(context); break;
            case 2: _add(context); break;
          }
        }
      ) // bottomnavigationbaritem
    ); // Scaffold
  }

  _home(context) {
    Navigator.pop(context);
  }

  _add(context) {
    Provider.of<BeefModel>(context, listen: false).add();
  }

  _sub(context) {
    var model = Provider.of<BeefModel>(context, listen: false);
    model.sub();
  }
}
