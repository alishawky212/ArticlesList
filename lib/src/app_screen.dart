
import 'package:arqaam_task/src/articel_list_screen.dart';
import 'package:flutter/material.dart';
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SkyAtricales',
      home: new Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          title: Text('SkyAtricales'),
        ),
        body:new ArticalesList(),
      ),
    );
  }

}