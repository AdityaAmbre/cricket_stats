import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cricket_stats/util/logger.dart';

class Api {
  Api();

  /// API Call - HTTP GET
  Future<Map<String, dynamic>?> apiCallHttpGet(String url) async {
    Map<String, dynamic>? data;

    // Host URL
    Logger.log("Host URL:", url);
    Uri hostUrl = Uri.parse(url);

    try {
      // API Call
      final r = await http.get(hostUrl);

      // Handle Response
      if (r.statusCode == 200) {
        data = json.decode(r.body);
        Logger.log("Response Success: ", "Data: ${data.toString()}");
        return data;
      } else {
        Logger.log("Response Failure: ", "Status Code: ${r.statusCode}\nData: ${data.toString()}");
        return null;
      }
    } catch (e) {
      Logger.log("Exception: ", e.toString());
      rethrow;
    }
  }
}