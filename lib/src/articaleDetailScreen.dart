
import 'package:arqaam_task/models/articale_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ArticaleDetailScreen extends StatelessWidget{

final ArticaleModel model;

ArticaleDetailScreen({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[topContent(context),
        bottomContent(context)
        ],
      ),
    );
  }

  Widget topContent(context){
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("background.png"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText(),
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: GestureDetector(child: Icon(Icons.arrow_back, color: Colors.white),
            onTap:(){
              Navigator.pop(context);
            } ,),
          ),
        )
      ],
    );
  }

  Widget topContentText(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          model.title,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
      ],
    );
  }

  Widget bottomContent(context){
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText()],
        ),
      ),
    );
  }

  Widget bottomContentText(){
    return Text(
      model.description,
      style: TextStyle(fontSize: 18.0),
    );
  }

}