import 'package:flutter/material.dart';
import 'package:todoapp/add_event.dart';
import 'package:todoapp/homepage.dart';
import 'package:todoapp/show_events.dart';
import 'package:todoapp/refactor/routers.dart';
import 'package:todoapp/update_events.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:Routers.homepage ,
      routes: {
        Routers.homepage:(context) => const Homepage(),
        Routers.add:(context) => const Add(),
        Routers.read:(context) => const Read(),
        Routers.update:(context) => const Update(),
        
      },
    );
  }
}