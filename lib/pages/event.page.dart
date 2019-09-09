import 'package:event_tracker/database/database.dart';
import 'package:event_tracker/pages/edit_event.page.dart';
import 'package:event_tracker/pages/teste.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class EventPage extends StatelessWidget{
  var _id;
  var _img;
  var _date;
  var _address;
  var _name;
  var _detail;
  var _url;
  var _category;

  EventPage(
      this._id,
      this._date,
      this._address,
      this._name,
      this._detail,
      this._img,
      this._url,
      this._category);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Text(_name),
          backgroundColor: Colors.black,
        ),
        drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new ListTile(
              title: new Text('Editar'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new EditEventPage(_id, _date, _address,_name, _detail, _img, _url, _category)));
              },
            ),
            new ListTile(
              title: new Text('Excluir'),
              onTap: () {
                deleteData(_id);
                Navigator.of(context).pushNamed('/event-list-page');
              },
            ),
          ],
        ),
      ),
      body: new Container(
        margin: new EdgeInsets.all(10.0),
        child: new Material(
          elevation: 4.0,
          borderRadius: new BorderRadius.circular(6.0),
          child: new ListView(
            children: <Widget>[
             _getImageNetwork(_img),
              _getBody(_name, _date, _detail, _address, _category, _url),
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
            fit: BoxFit.cover,
            )
        );

  }

  Widget _getBody(name, date, detail, address, category, url){

    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getName(name),
          _getDate(date),
          _getDetail(detail),
          _getAddress(address),
          _getUrl(url),
          _getCategory(category),
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

  _getDetail(detail) {
    return new Container(
      margin: new  EdgeInsets.only(top: 20.0),
      child: new Text(detail),
    );
  }

  _getAddress(address) {
    return new Container(
      margin: new  EdgeInsets.only(top: 80.0),
      child: new Text(address,
        style: new TextStyle(
                  fontSize: 11.0,
                  color: Colors.grey
              ),),
    );
  }

  _getCategory(category) {
    return new Container(
      margin: new  EdgeInsets.only(top: 20.0),
      child: new Text(category,
      style: new TextStyle(
                  fontSize: 9.0,
                  color: Colors.black
              ),
      ),
    );
  }

  _getUrl(url) {
    return new Container(
      margin: new  EdgeInsets.only(top: 5.0),
      child: new Text(url,
      style: new TextStyle(
                  fontSize: 9.0,
                  color: Colors.grey
              ),),
    );
  }

}