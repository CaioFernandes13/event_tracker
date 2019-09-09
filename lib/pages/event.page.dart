import 'package:flutter/material.dart';

class EventPage extends StatelessWidget{

  var _img;
  var _date;
  var _address;
  var _name;
  var _detail;
  var _url;
  var _category;

  EventPage(this._date,
      this._address,
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
              _getBody(_name,_date,_detail),
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

  Widget _getBody(name,date,detail){

    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getName(name),
          _getDate(date),
          _getdetail(detail),
        ],
      ),
    );
  }

  _getName(name) {
    return new Text(name,
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

  _getdetail(detail) {
    return new Container(
      margin: new  EdgeInsets.only(top: 20.0),
      child: new Text(detail),
    );
  }

}