import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UuidService {
  static Future<String> getVisitorId() async {
    final prefs = await SharedPreferences.getInstance();

    String? visitorId = prefs.getString('visitorId');

    if (visitorId != null) {
      return visitorId;
    } else {
      visitorId = const Uuid().v4();
      await prefs.setString('visitorId', visitorId);
      return visitorId;
    }
  }
}
