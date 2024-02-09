import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location = '';
  String time = '';
  String flag = '';
  String url = 'Europe/London';
  bool isDayTime = true;

  WorldTime(String location, String flag, String url) {
    this.location = location;
    this.flag = flag;
    this.url = url;

  }

  Future<void> getTime() async {

    try {
      final locUri = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(locUri);

      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // print(datetime);
      // print(offset);

      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
    }catch(e) {
      print(e);
      time = "Could not get time data";
    }
  }

}

