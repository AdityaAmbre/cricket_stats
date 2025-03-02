import 'package:cricket_stats/util/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class Util {
  Util();

  static Future<void> openUrl(String link) async {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Logger.log("Error launching URL:", "$url");
    }
  }
}