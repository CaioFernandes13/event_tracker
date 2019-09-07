import 'package:event_tracker/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

import '../repositorio.dart';

class FavPage extends StatefulWidget {
  FavPage({Key key}) : super(key: key);

  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  List _events = new List();
  var repositorio = new EventsAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Busca Online - Event Tracker"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: _getListViewWidget(),
        ));
  }

  @override
  void initState() {
    loadEvents();
  }

  Widget _getListViewWidget() {
    var list = new ListView.builder(
        itemCount: _events.length,
        padding: new EdgeInsets.only(top: 5.0),
        itemBuilder: (context, index) {
          return _events[index];
        });
    return list;
  }

  loadEvents() async {
    List result = await repositorio.loadEvents();
    print("TESTE");
    print(result);
    setState(() {
      result.forEach((item) {
        var notice = new Event(
            item['url_img'], item['title'], item['date'], item['description']);

        _events.add(notice);
      });
    });
  }



}

