// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController updatecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CollectionReference fetchdata =
        FirebaseFirestore.instance.collection("info");

    void updateEvent(docId) {
      final data = {"event": updatecontroller.text.trim()};
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("update successfully")));
      updatecontroller.clear();
      fetchdata.doc(docId).update(data);
    }

    final argEvent = ModalRoute.of(context)?.settings.arguments as Map?;

    updatecontroller.text = argEvent?["argevent"];
    final docId = argEvent?["id"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("update events"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 75, right: 15, left: 15),
              child: TextField(
                controller: updatecontroller,
                decoration: InputDecoration(
                    hintText: "enter event",
                    icon: const Icon(Icons.calendar_month_sharp),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  updateEvent(docId);
                },
                child: const Text("update"))
          ],
        ),
      ),
    );
  }
}
