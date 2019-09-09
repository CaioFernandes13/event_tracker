import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_tracker/models/event.dart';
import 'dart:async';
import 'dart:convert';

final database = Firestore.instance;

void createRecord(Event event) async {
  //Passa o objeto que será incluído no firestore
  await database
      .collection("events")
      .document() //nome do documento no banco, caso deixe vazio,
      // próprio firestore gera um nome único pra ele
      .setData(event.toJson()); //setData insere o objeto no firestore
  //o método "toJson" já coloca no padrão esperado para inserir no firestore
}

retrieveData() async{
   return await database.collection('events').getDocuments();
  
}

void updateData(String documentID, Event event) {
  try {
    database
        .collection("events")
        .document(documentID)
        .updateData(event.toJson());
  } catch (e) {
    print(e.toString());
  }
}

void deleteData(String documentID) {
  try {
    database
        .collection("events")
        .document(documentID)
        .delete(); //função que exclui o documento do banco
  } catch (e) {
    print(e.toString());
  }
}
