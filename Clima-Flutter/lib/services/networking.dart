import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Uri url;
  NetworkHelper({this.url});

  Future<Map> getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200){
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      return null;
    }
  }

}