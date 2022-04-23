import 'package:shared_preferences/shared_preferences.dart';

class SavetoDevice {
  saveUrls(String url) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      List<String>? _urlList = await prefs.getStringList(
        'urls',
      );
      if (_urlList![0] == "") {
        _urlList.clear();
      }
      _urlList.add(url);
      await prefs.setStringList("urls", _urlList);
    } catch (e) {
      await prefs.setStringList("urls", <String>[""]);
    }
  }

  Future<List<String>?> getUrls() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? _urlList = await prefs.getStringList(
      'urls',
    );
    return _urlList;
  }
}
