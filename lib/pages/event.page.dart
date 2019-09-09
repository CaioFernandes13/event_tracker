import 'package:flutter/material.dart';

class EventPage extends StatelessWidget{

  var _img;
  var _start_date;
  var _end_date;
  var _name;
  var _detail;
  var _url;
  var _category;

  EventPage(this._start_date,
      this._end_date,
      this._name,
      this._detail,
      this._img,
      this._url,
      this._category);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: new Container(
        margin: new EdgeInsets.all(10.0),
        child: new Material(
          elevation: 4.0,
          borderRadius: new BorderRadius.circular(6.0),
          child: new ListView(
            children: <Widget>[
             _getImageNetwork(_img),
              _getBody(_name,_start_date,_detail),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getImageNetwork(url){

    return new Container(
          height: 200.0,
          child: new Image.network(
            url,
            fit: BoxFit.cover)
        );

  }

  Widget _getBody(tittle,date,description){

    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getTittle(tittle),
          _getDate(_start_date),
          _getDescription(description),
        ],
      ),
    );
  }

  _getTittle(tittle) {
    return new Text(tittle,
    style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0),
    );
  }

  _getDate(date) {

    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Text(date,
            style: new TextStyle(
                fontSize: 10.0,
                color: Colors.grey
            ),
          )
    );
  }

  _getDescription(description) {
    return new Container(
      margin: new  EdgeInsets.only(top: 20.0),
      child: new Text(description),
    );
  }

}