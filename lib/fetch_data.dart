import 'package:http/http.dart';
import 'dart:convert';

int confirmedCases;
int deaths;
int recovered;
int active;
String lastUpdated;

class FetchData {
  Future fetchCountryData() async {
    Future<int> dataFetcher(String caseType) async {
      Response response;
      response = await get(
          'https://api.covid19api.com/dayone/country/india/status/$caseType');
      List data = jsonDecode(response.body);
      lastUpdated = data[data.length - 1]['Date'];
      return data[data.length - 1]['Cases'];
    }

    confirmedCases = await dataFetcher("confirmed");
    print(confirmedCases);
    deaths = await dataFetcher("deaths");
    recovered = await dataFetcher("recovered");
    active = confirmedCases - (recovered + deaths);
  }

  Future<List> fetchDataByState() async {
    List<Map> stateData = [];
    Response response;
    response =
        await get('https://api.covid19api.com/live/country/india/status/confirmed/date/2021-04-23T00:00:00Z#');
    List data = jsonDecode(response.body);

    for (int i = data.length - 1; i >= data.length - 36 ; i--) {
      stateData.add({
        'state': data[i]['Province'].toString(),
        'confirmed': data[i]['Confirmed'].toString(),
        'deaths': data[i]['Deaths'].toString(),
        'recovered': data[i]['Recovered'].toString(),
        'active': data[i]['Active'].toString(),
      });
    }
    return stateData;
  }
}
