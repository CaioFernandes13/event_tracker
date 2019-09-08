import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              height: 450,
              width: 450,
              child: Image.asset("assets/hex.png"),
              padding: EdgeInsets.all(20),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/register-event-page');
              },
              child: Text(
                "Cadastrar Evento",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              color: Colors.black,
              padding: EdgeInsets.all(10),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/bonline-page');
              },
              child: Text(
                "Busca Online",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              color: Colors.black,
              padding: EdgeInsets.all(10),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/fav-page');
              },
              child: Text(
                "Favoritos",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              color: Colors.black,
              padding: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}
