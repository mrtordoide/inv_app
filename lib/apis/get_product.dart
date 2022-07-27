import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchProduct() async {
  var data = await http.get(Uri.parse("http://10.0.2.2:8000/product"));
  var jsonData = json.decode(data.body);

  List product = jsonData;

  return product;
}
