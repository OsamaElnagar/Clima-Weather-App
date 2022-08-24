import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utilities/constants.dart';

class NetworkHelper {
   final String url;

  NetworkHelper(this.url);

   Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String  data = response.body;
      return jsonDecode(data);
    } else {
      pint(response.statusCode.toString());
    }
  }
   Future<dynamic> postData() async {
     http.Response response = await http.post(Uri.parse(url));
     if (response.statusCode == 200) {
       String  data = response.body;
       return jsonDecode(data);
     } else {
       pint(response.statusCode.toString());
     }
   }

}
