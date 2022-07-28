import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchCategory() async {
  // var data = await http.get(Uri.parse("http://10.0.2.2:8000/category"));
  var data = await http.get(
      Uri.parse("https://mimi-inventory-app.herokuapp.com/api/v1/category"));
  var jsonData = json.decode(data.body);

  List categories = jsonData["result"];

  return categories;
}
