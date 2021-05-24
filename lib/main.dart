
import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/home_page.dart';
import 'package:world_time_app/pages/loading_page.dart';


  void main() =>runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'loadingPage',
    routes: {
      'loadingPage':(context)=>loading(),
      'homePage':(context)=>Home(),
      'locationPage':(context)=>location(),
  },

  )
  );


