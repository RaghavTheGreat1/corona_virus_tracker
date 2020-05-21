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

  Future<List> fetchDataByState() async {
    List<Map> stateData = [];
    Response response;
    response =
        await get('https://covid-19india-api.herokuapp.com/v2.0/state_data');
    List data = jsonDecode(response.body);
    for (int i = 0; i < data[1]["state_data"].length; i++) {
      stateData.add({
        'state': data[1]['state_data'][i]['state'].toString(),
        'confirmed': data[1]['state_data'][i]['confirmed'].toString(),
        'deaths': data[1]['state_data'][i]['deaths'].toString(),
        'recovered': data[1]['state_data'][i]['recovered'].toString(),
        'active': data[1]['state_data'][i]['active'].toString(),
      });

    }
    return stateData;
  }
}
