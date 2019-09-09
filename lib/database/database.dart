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

Future <List> retrieveData() async{
  await database
      .collection("events")
      .getDocuments() //Caso queira um documento específico, basta substituir
      //essa linha por ".document("nome do documento")
      .then((QuerySnapshot snapshot) {
    //snapshot.documents.forEach((f) => print('${f.data}}'));
    //return jsonDecode(snapshot);
    return snapshot.documents;
  });
}

void updateData() {
  try {
    database
        .collection("events")
        .document("nome do documento a ser atualizado")
        //Caso precisemos atualizar algo no firestore, precisaremos
        // saber o nome do arquivo no firestore
        .updateData({'nome do campo': 'dado'});
    //Aqui escolhemos qual campo queremos mudar, informando o campo e o dado a
    //ser atualizado
  } catch (e) {
    print(e.toString());
  }
}

void deleteData() {
  try {
    database
        .collection("events")
        .document("nome do documento a ser excluído")
        .delete(); //função que exclui o documento do banco
  } catch (e) {
    print(e.toString());
  }
}
