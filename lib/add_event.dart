// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController eventcontroller = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD EVENTS"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                 padding: const EdgeInsets.only(top: 75, right: 15, left: 15),
                 child: TextField(
                  controller: eventcontroller,
                  decoration: InputDecoration(
                          
                          hintText: "enter event",
                          icon: const Icon(Icons.calendar_month_sharp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                           ),
               ),
               const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () async {
                  if(eventcontroller.text.trim().isEmpty)
                  {
                     ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("enter event")));
      
                  }
                  else
                  {
                     await FirebaseFirestore.instance.collection("info").add({
                    "event": eventcontroller.text.trim(),
                  });
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("event added successfully")));
                      eventcontroller.clear();
                  }
                 
                },
        
                child: const Text("submit")
                )
          ],
        ),
      ),
    );
  }
}
