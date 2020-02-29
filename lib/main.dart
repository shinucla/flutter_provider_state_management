import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_provider_state_management/ChickenPage.dart';
import 'package:flutter_provider_state_management/BeefPage.dart';
import 'package:flutter_provider_state_management/model/ChickenModel.dart';
import 'package:flutter_provider_state_management/model/BeefModel.dart';

void main() => runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ChickenModel()),
      ChangeNotifierProvider(create: (context) => BeefModel()),
    ],
    child: MaterialApp(
      home: Home(),
    )
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing"),
      ),
      body: Center(
        child: Column(
          children: [
            ChickenModelConsumerWidget(),//Text("Chicken sandwitchs: "),
            BeefModelConsumerWidget(),//Text("Beef sandwitchs: "),
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            title: Text('Chicken')),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            title: Text('Beef')),
        ],
        onTap: (index) {
          switch (index) {
            case 0: _navToChicken(context); break;
            case 1: _navToBeef(context); break;
          }
        }
      )
    );
  }

  ChickenModelConsumerWidget() {
    return Consumer<ChickenModel>(
      builder: (context, model, child) {
        return Text("Chicken Sandwitch: ${model.number}.");
      }
    );
  }
  
  BeefModelConsumerWidget() {
    return Consumer<BeefModel>(
      builder: (context, model, child) {
        return Text("Beef Sandwitch: ${model.number}.");
      }
    );
  }

  _navToChicken(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChickenPage()),
    );
  }

  _navToBeef(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BeefPage()),
    );
  }
}
