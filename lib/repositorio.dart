import 'dart:async';
import 'dart:convert';

class EventsAPI{

  Future <List> loadEvents() async{
    String json = "[{"+
      "\"date\": \"2018-09-21 22:00:00\","+
      "\"name\": \"Workshop da Sympla\","+
      "\"detail\": \"<b>Ola esse é um evento da Sympla</b><br><h1>Sejam todos bem-vindo</h1>\","+
      "\"image\": \"https://www.sympla.com.br/images/public/logo-sympla-new-blue@3x.png\","+
      "\"url\": \"https://www.sympla.com.br/festa-800__332504\","+
      "\"address\": \"Loja Contempo, Rua Fernandes Tourinho, 908, 10º Andar, Funcionários, Belo Horizonte, MG, 31112-000, BR\","+
      "\"category\": \"Festa\""+
    "}]";
    return jsonDecode(json);

  }

}