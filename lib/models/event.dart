import 'package:event_tracker/pages/event.page.dart';
import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  var _img;
  var _start_date;
  var _end_date;
  var _name;
  var _detail;
  var _url;
  var _category;

  Event(
      this._start_date,
      this._end_date,
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
        return new EventPage(_start_date, _end_date,
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
          _getColumText(_start_date, _end_date,
              _name, _detail, _url, _category),
        ],
      ),
    );
  }

  Widget _getColumText(start_date, end_date, name,
      detail, url, category) {
    return new Expanded(
        child: new Container(
      margin: new EdgeInsets.all(10.0),
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getStartDateWidget(_start_date),
            _getEndDateWidget(_end_date),
            _getNameWidget(_name),
            _getDetailWidget(_detail),
            _getUrlWidget(_url),
            _getCategoryWidget(_category),
          ]),
    ));
  }

  Widget _getStartDateWidget(String start_date) {
    return new Text(
      start_date,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }

  Widget _getEndDateWidget(end_date) {
    return new Text(
      end_date,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }

  Widget _getCategoryWidget(category) {
    return new Text(
      category,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }

  Widget _getNameWidget(name) {
    return new Text(
      name,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
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
    _start_date = json['start_date'];
    _end_date = json['end_date'];
    _name = json['name'];
    _detail = json['detail'];
    _url = json['url'];
    _category = json['category'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> json = new Map<String, dynamic> ();
    json['image'] = this._img;
    json['start_date'] = this._start_date;
    json['end_date'] = this._end_date;
    json['name'] = this._name;
    json['detail'] = this._detail;
    json['url'] = this._url;
    json['category'] = this._category;
    return json;
  }

}
