import 'package:flutter/material.dart';

class Event extends StatelessWidget{

  var _img;
  var _title;
  var _date;
  var _description;

  Event(this._img,this._title,this._date,this._description);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;

    //Foi adicionado dentro de Container para adicionar margem no item
    return new Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0,bottom: 10.0,top: 0.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(6.0),
        elevation: 2.0,
        child: _getListTile(),
      ),
    );
  }

  Widget _getListTile(){

    // Foi adicionado dentro de Container para adicionar altura fixa.
    return new Container(
      height: 95.0,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new FadeInImage.assetNetwork(placeholder: '', image: _img,fit: BoxFit.cover,width: 95.0,height: 95.0,),
          _getColumText(_title,_date,_description),
      ],

    ),
    );

  }

  Widget _getColumText(tittle,date, description){

    return new Expanded(
        child: new Container(
          margin: new EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              _getTitleWidget(_title),
              _getDateWidget(_date),
              _getDescriptionWidget(_description)],
          ),
        )
    );
  }

  Widget _getTitleWidget(String currencyName){
    return new Text(
      currencyName,
      maxLines: 1,
      style: new TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _getDescriptionWidget(String description){
    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Text(description,maxLines: 2,),
    );
  }

  Widget _getDateWidget(String date){
    return new Text(date,
      style: new TextStyle(color: Colors.grey,fontSize: 10.0),);
  }

  /*
  Event.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    StartDate = json['StartDate'];
    pais = json['pais'];
    cidade = json['cidade'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> json = new Map<String, dynamic> ();
    json['id'] = this.id;
    json['nome'] = this.nome;
    json['descricao'] = this.descricao;
    json['StartDate'] = this.StartDate;
    json['pais'] = this.pais;
    json['cidade'] = this.cidade;
    json['latitude'] = this.latitude;
    json['longitude'] = this.longitude;
    return json;
  }*/

}