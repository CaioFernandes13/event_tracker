import 'package:event_tracker/pages/event.page.dart';
import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  var _id;
  var _img;
  var _date;
  var _address;
  var _name;
  var _detail;
  var _url;
  var _category;

  Event(
      this._id,
      this._date,
      this._address,
      this._name,
      this._detail,
      this._img,
      this._url,
      this._category);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return new Container(
      margin: const EdgeInsets.only(
      left: 10.0, right: 10.0, bottom: 10.0, top: 0.0),
      child: new Material(
          borderRadius: new BorderRadius.circular(6.0),
          elevation: 2.0,
          child: new InkWell(
            onTap: showDetail,
            splashColor: Colors.blue,
            child: _getListTile(),
          ),
        ),
    );
  }

   showDetail() {
      Navigator
      .of(_context)
      .push(new MaterialPageRoute(builder: (BuildContext context) {
        return new EventPage(_id, _date, _address,
              _name, _detail, _img, _url, _category);
      }));
    }

  Widget _getListTile() {
    // Foi adicionado dentro de Container para adicionar altura fixa.
    return new Container(
      height: 95.0,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new FadeInImage.assetNetwork(
            placeholder: '',
            image: _img,
            fit: BoxFit.cover,
            width: 95.0,
            height: 95.0,
          ),
          _getColumText(_date, _address,
              _name, _detail, _url, _category),
        ],
      ),
    );
  }

  Widget _getColumText(date, address, name,
      detail, url, category) {
    return new Expanded(
        child: new Container(
      margin: new EdgeInsets.all(10.0),
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getNameWidget(_name),
            _getDateWidget(_date),
            new Container(height: 10,),
            _getAddressWidget(_address),
            new Container(height: 10,),
            _getCategoryWidget(_category),
          ]),
    ));
  }

  Widget _getDateWidget(String date) {
    return new Text(
      date,
      style: new TextStyle(color: Colors.grey, fontSize: 8.0),
    );
  }

  Widget _getAddressWidget(address) {
    return new Text(
      address,
      style: new TextStyle(color: Colors.grey, fontSize: 8.0),
    );
  }

  Widget _getCategoryWidget(category) {
    return new Text(
      category,
      style: new TextStyle(color: Colors.black54, fontSize: 8.0),
    );
  }

  Widget _getNameWidget(name) {
    return new Text(
      name,
      style: new TextStyle(color: Colors.black, fontSize: 13.0),
    );
  }

  Widget _getDetailWidget(detail) {
    return new Text(
      detail,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }

  Widget _getUrlWidget(url) {
    return new Text(
      url,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }

  
  Event.fromJson(Map<String, dynamic> json){
    _img = json['image'];
    _date = json['date'];
    _address = json['address'];
    _name = json['name'];
    _detail = json['detail'];
    _url = json['url'];
    _category = json['category'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> json = new Map<String, dynamic> ();
    json['image'] = this._img;
    json['date'] = this._date;
    json['address'] = this._address;
    json['name'] = this._name;
    json['detail'] = this._detail;
    json['url'] = this._url;
    json['category'] = this._category;
    return json;
  }

}
