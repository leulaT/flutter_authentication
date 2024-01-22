import 'package:allena_tech/utils/api_services.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;

class NetworkHelper {
  static Future httpPost({url, body}) async {
    /// make POST request
    try {
      final response = await post(
        Uri.parse(url),
        body: body,
      );
      int statusCode = response.statusCode;
      //if success
      print("${response.body} ==response==========");
      if (statusCode == 200) {
        return convert.jsonDecode(response.body);
      } else {
        if (statusCode == 500) {
          return 'Internal Server error';
        } else if (statusCode == 404) {
          return 'Resource Not Found';
        } else if (statusCode == 403) {
          return 'Forbiden';
        } else if (statusCode == 401) {
          return 'Not authorized';
        } else if (statusCode == 400) {
          return 'Bad Request';
        }
        return 'Failed to fetch';
      }
    } catch (e) {
      return e;
    }
  }

  static Future httpGet(url) async {
    /// make get request

    try {
      Response response = await get(url);
      int statusCode = response.statusCode;
      if (!(statusCode < 200 || statusCode > 400)) {
        // var jsonResponse = convert.jsonDecode(response.body);
        // print(jsonResponse);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return response.statusCode;
      }
      return response.body;
      // return convert.jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }
}
