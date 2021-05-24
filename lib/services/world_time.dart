import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time='';
  String flag;
  String url;
  bool isDayTime=false;
  WorldTime({required this.location,required this.flag,required this.url});


  Future<void> getTime() async {
    try {
      var temp = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      Response response = await get(temp);
      print(response.body);
      Map data = jsonDecode(response.body);
      print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      print(datetime);
      print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime=(now.hour>6) && (now.hour<17)?(true):(false);
      print(now);
      time=DateFormat.jm().format(now);
print('time in world dart $time');

    }


  catch(e){
    print('could not load data: $e');
    time='error';
  }


  }


}