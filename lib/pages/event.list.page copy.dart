import 'dart:async';

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../database/database.dart';

class EventListPage extends StatefulWidget {
  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  String carModel;
  String carColor;

  QuerySnapshot events;


  @override
  void initState() {
    retrieveData().then((results) {
      setState(() {
        events = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                retrieveData().then((results) {
                  setState(() {
                    events = results;
                  });
                });         
              },
            )
          ],
        ),
        body: _carList());
  }

  Widget _carList() {
    if (events != null) {
      return ListView.builder(
        itemCount: events.documents.length,
        padding: EdgeInsets.all(5.0),
        itemBuilder: (context, i) {
          return new ListTile(
            title: Text(events.documents[i].data['name']),
            subtitle: Text(events.documents[i].data['detail']),
          );
        },
      );
    } else {
      return Text('Loading, Please wait..');
    }
  }
}