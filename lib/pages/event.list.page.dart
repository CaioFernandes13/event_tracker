import 'package:event_tracker/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../database/database.dart';
import '../repositorio.dart';

class EventListPage extends StatefulWidget {
  EventListPage({Key key}) : super(key: key);

  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  List _events = new List();
  var repositorio = new EventsAPI();
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de eventos - Event Tracker"),
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
    List result = await retrieveData();
    //print("TESTE");
    print(result);
    setState(() {
      result.forEach((item) {
        var event = new Event(
            item['date'], item['address'], item['name'], item['detail'],
            item['image'], item['url'],item['category']
            );

        _events.add(event.toJson());
      });
    });
  }

}

