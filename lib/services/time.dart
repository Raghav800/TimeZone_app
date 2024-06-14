import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location = '';
  String time = '';
  String flag = '';
  String urf = '';
  bool isDaytime = false;

  WorldTime({this.location = '' , this.flag = '' , this.urf = '',this.isDaytime = false});

  Future<void> getTime() async
  {
    try
        {
          Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/$urf');
          Response response = await get(url);
          Map data = jsonDecode(response.body);

          String datetime = data['utc_datetime'];
          String offset1 = data['utc_offset'].substring(1,3);
          String offset2 = data['utc_offset'].substring(4);

          DateTime now = DateTime.parse(datetime);
          now = now.add(Duration(hours: int.parse(offset1) , minutes: int.parse(offset2)));

          time = DateFormat.jm().format(now);

          isDaytime = now.hour > 6 && now.hour < 20;
        }

        catch(e)
       {
         print('caught an error $e');
         time = 'could not fetch the time';
       }

  }
}

