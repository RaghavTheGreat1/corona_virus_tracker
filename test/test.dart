import 'package:http/http.dart';
import 'dart:convert';

main() async{
  Response response = await get('https://api.covid19api.com/live/country/india');
  List data = jsonDecode(response.body);
  print(data[data.length - 1]['Confirmed']);
}