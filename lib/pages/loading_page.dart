import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
        class loading extends StatefulWidget {

          @override
          _loadingState createState() => _loadingState();
        }



        class _loadingState extends State<loading> {


          void setUpWorldTime() async{
            WorldTime instance = new WorldTime(location: 'Berlin', flag: 'germany.png', url:'Europe/Berlin');
            await instance.getTime();
            Navigator.pushReplacementNamed(context, 'homePage', arguments: {
              'location': instance.location,
              'flag': instance.flag,
              'time': instance.time,
              'isDayTime':instance.isDayTime,
            });
          }

          @override
        void initState() {
          // TODO: implement initState
      print('start');
          super.initState();
          setUpWorldTime();
        }
                @override
          Widget build(BuildContext context) {
            return Scaffold(
              backgroundColor: Colors.blue[900],
              body: Center(
              child: SpinKitFadingCube(
              color: Colors.white,
              size: 50.0,
            )
                  )
            );
          }
        }
