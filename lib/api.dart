import 'dart:convert';

import 'package:http/http.dart' as http;

getMovie() async {
  var url = Uri.parse('https://www.omdbapi.com/?s=spiderman&apikey=2c2c3302');
  var response = await http.get(url);
  var data = await jsonDecode(response.body);
  return data; 
}