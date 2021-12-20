import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const String apiKey = 'AEB91EC2-40B3-444B-84C6-83F2DE9B3BF5';

class CoinData {

  Future<String> getRate(String base, String quote) async {
    Uri url = Uri.parse('https://rest.coinapi.io/v1/exchangerate/$base/$quote?apikey=$apiKey');
    http.Response response = await http.get(url);
    Map data = json.decode(response.body);
    return data['rate'].round().toString();
  }
}
