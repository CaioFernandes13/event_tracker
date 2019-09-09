import 'package:event_tracker/models/event.dart';
import 'package:flutter/material.dart';

import '../database/database.dart';

class RegisterEventPage extends StatefulWidget {
  @override
  _RegisterEventPageState createState() => _RegisterEventPageState();
}

class _RegisterEventPageState extends State<RegisterEventPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  //Event event = new Event(_img, _title, _date, _description)
  Event event;
  bool _validate = false;
  String _date, _name, _detail, _image, _url, _category, _address;
    /*
    {
      "id": 1,
      "start_date": "2018-09-21 22:00:00",
      "end_date": "2018-09-22 12:00:01",
      "name": "Workshop da Sympla",
      "detail": "<b>Ola esse é um evento da Sympla</b><br><h1>Sejam todos bem-vindo</h1>",
      "image": "https://www.sympla.com.br/images/public/logo-sympla-new-blue@3x.png",
      "url": "https://www.sympla.com.br/festa-800__332504",
      "address": {
        "name": "Loja Contempo",
        "address": "Rua Fernandes Tourinho",
        "address_num": "AB45ER78",
        "address_alt": "10º Andar",
        "neighborhood": "Funcionários",
        "city": "Belo Horizonte",
        "state": "MG",
        "zip_code": "31112-000",
        "country": "BR"
      },
      "category": "Festa"
    }*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Formulário com Validação'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              autovalidate: _validate,
              child: _formUI(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _formUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Nome do Evento'),
          maxLength: 40,
          validator: _validarNome,
          onSaved: (String val) {
            _name = val;
          },
        ),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Data de Início'),
            keyboardType: TextInputType.datetime,
            maxLength: 10,
            //validator: _validarData,
            onSaved: (String val) {
              _date = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Descrição'),
            keyboardType: TextInputType.multiline,
            maxLength: 200,
            onSaved: (String val) {
              _detail = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Imagem'),
            keyboardType: TextInputType.multiline,
            maxLength: 200,
            onSaved: (String val) {
              _image = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Link do evento'),
            keyboardType: TextInputType.url,
            maxLength: 100,
            onSaved: (String val) {
              _url = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Local'),
            keyboardType: TextInputType.text,
            maxLength: 200,
            onSaved: (String val) {
              _address = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Categoria'),
            keyboardType: TextInputType.text,
            maxLength: 30,
            onSaved: (String val) {
              _category = val;
            }),
        new SizedBox(height: 15.0),
        new RaisedButton(
          onPressed: _sendForm,
          child: new Text('Enviar'),
        )
      ],
    );
  }

  String _validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String _validarCelular(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o celular";
    } else if(value.length != 10){
      return "O celular deve ter 10 dígitos";
    }else if (!regExp.hasMatch(value)) {
      return "O número do celular so deve conter dígitos";
    }
    return null;
  }

  String _validarEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if(!regExp.hasMatch(value)){
      return "Email inválido";
    }else {
      return null;
    }
  }

  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      event = new Event('',_date, _address, _name, _detail, _image, _url, _category);
      print(event.toJson());
      createRecord(event);

      /*print("Nome $nome");
      print("Ceclular $celular");
      print("Email $email");*/
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }
}