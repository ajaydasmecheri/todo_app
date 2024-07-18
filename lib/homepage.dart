import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/refactor/routers.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Center(child: Text("T o - D o   L i s t")),),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, Routers.add);

            }, child: const Text("ADD EVENTS")),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, Routers.read);

            }, child: const Text("SHOW ENENTS"))
          ],
        ),
      ),
    );
  }
}