import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:animated_widgets/animated_widgets.dart';
          class location extends StatefulWidget {
            @override
            _locationState createState() => _locationState();
          }



            class _locationState extends State<location> {
            Map location_data={};

            List<WorldTime> locations=[
              WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
              WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
              WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
              WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
              WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
              WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
              WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
              WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
            ];
            void updateTime(index) async {
              WorldTime instance = locations[index];
              await instance.getTime();
              Navigator.pop(context, {
                'location': instance.location,
                'time': instance.time,
                'flag': instance.flag,
                'isDaytime': instance.isDaytime,
              });
            }
            @override
              Widget build(BuildContext context) {
                return Scaffold(
                  backgroundColor: Colors.grey[200],
                  appBar: AppBar(
                    title: Text('Choose  Location',
                      style: TextStyle(
                        fontFamily: 'font1.otf',
                        fontSize: 30.0,


                      ),
                    ),
                    backgroundColor: Colors.blue[900],
                    centerTitle: true,
                    elevation: 0.0,
                  ),



                  body: ListView.builder(
                    itemExtent: 89.0,
                      itemCount: locations.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6),
                            child: ListTile(
                              onTap: () {
                                updateTime(index);
                              },
                              leading: CircleAvatar(
                                radius:  25.0,
                                backgroundImage: AssetImage('assets/${locations[index].flag}'),),

                                title: Text(' ${locations[index].location}',style: TextStyle(
                                  fontFamily: 'font1.otf',
                                  //fontWeight: FontWeight.w800,
                                  fontSize: 22.0,
                                ),
                                ),

                            ),

                        );
                      }
                  ),
                );
              }
            }
