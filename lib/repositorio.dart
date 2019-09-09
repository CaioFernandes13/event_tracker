import 'dart:async';
import 'dart:convert';

class EventsAPI{

  Future <List> loadEvents() async{
    String json = "[{"+
      "\"start_date\": \"2018-09-21 22:00:00\","+
      "\"end_date\": \"2018-09-22 12:00:01\","+
      "\"name\": \"Workshop da Sympla\","+
      "\"detail\": \"<b>Ola esse é um evento da Sympla</b><br><h1>Sejam todos bem-vindo</h1>\","+
      "\"image\": \"https://www.sympla.com.br/images/public/logo-sympla-new-blue@3x.png\","+
      "\"url\": \"https://www.sympla.com.br/festa-800__332504\","+
      "\"address\": {"+
      "  \"name\": \"Loja Contempo\","+
      "  \"address\": \"Rua Fernandes Tourinho\","+
      "  \"address_num\": \"AB45ER78\","+
      "  \"address_alt\": \"10º Andar\","+
      "  \"neighborhood\": \"Funcionários\","+
      "  \"city\": \"Belo Horizonte\","+
      "  \"state\": \"MG\","+
      "  \"zip_code\": \"31112-000\","+
      "  \"country\": \"BR\""+
      "},"+
      "\"category\": \"Festa\""+
    "}]";
    return jsonDecode(json);

  }

}