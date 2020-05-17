import 'package:http/http.dart';
import 'dart:convert';

int confirmedCases;
int deaths;
int recovered;
int active;
String lastUpdated;

class FetchData {
  Future fetchCountryData() async {
    Response response;
    response =
        await get('https://covid-19india-api.herokuapp.com/v2.0/country_data');
    List data = jsonDecode(response.body);
    confirmedCases = data[1]['confirmed_cases'];
    deaths = data[1]['death_cases'];
    recovered = data[1]['recovered_cases'];
    active = data[1]['active_cases'];
    lastUpdated = data[1]['last_updated'];
  }

  Future fetchDataByCity() async {
    
    Response response;
    response =
        await get('https://covid-19india-api.herokuapp.com/v2.0/state_data');
    List data = jsonDecode(response.body);
    confirmedCases = data[1]['confirmed_cases'];
    deaths = data[1]['death_cases'];
    recovered = data[1]['recovered_cases'];
    active = data[1]['active_cases'];
    lastUpdated = data[1]['last_updated'];
  }
}
