import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  var _address_name,
      _address,
      _address_num,
      _address_alt,
      _neighborhood,
      _city,
      _state,
      _country;

  BuildContext _context;

  Address(
      this._address_name,
      this._address,
      this._address_num,
      this._address_alt,
      this._neighborhood,
      this._city,
      this._state,
      this._country);

  @override
  Widget build(BuildContext context) {
    this._context = context;

    //Foi adicionado dentro de Container para adicionar margem no item
    return new Container(
      margin: const EdgeInsets.only(
          left: 10.0, right: 10.0, bottom: 10.0, top: 0.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(6.0),
        elevation: 2.0,
        child: _getListTile(),
      ),
    );
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
            fit: BoxFit.cover,
            width: 95.0,
            height: 95.0,
          ),
          _getColumText(_address_name, _address, _address_num, _address_alt,
              _city, _neighborhood, _state, _country),
        ],
      ),
    );
  }

  Widget _getColumText(address_name, address, address_num, address_alt, city,
      neighborhood, state, country) {
    return new Expanded(
        child: new Container(
      margin: new EdgeInsets.all(10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getAddrNameWidget(address_name),
          _getAddrWidget(address),
          _getAddrNumWidget(address_num),
          _getAddrAltWidget(address_alt),
          _getCituWidget(city),
          _getNeighborhoodWidget(neighborhood),
          _getStateWidget(state),
          _getContryWidget(country),
        ],
      ),
    ));
  }

  Widget _getAddrNameWidget(String currencyName) {
    return new Text(
      currencyName,
      maxLines: 1,
      style: new TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _getDescriptionWidget(String description) {
    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Text(
        description,
        maxLines: 2,
      ),
    );
  }

  Widget _getAddrWidget(String date) {
    return new Text(
      date,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }

  _getAddrNumWidget(address_num) {
    return new Text(
      address_num,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }

  _getAddrAltWidget(address_alt) {
    return new Text(
      address_alt,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }

  _getCituWidget(city) {
    return new Text(
      city,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }

  _getNeighborhoodWidget(neighborhood) {
    return new Text(
      neighborhood,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }

  _getStateWidget(state) {
    return new Text(
      state,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }

  _getContryWidget(country) {
    return new Text(
      country,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }
}
