import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/refactor/routers.dart';

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  final datas = FirebaseFirestore.instance.collection("info");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("show events"),
        ),
        body: StreamBuilder(
          stream: datas.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot infodata = snapshot.data!.docs[index];
                  return Card(
                    color: Colors.amber.shade100,
                    shadowColor: Colors.red,
                      elevation: 2.0,
                      child: Column(children: [
                        ListTile(
                          title: Text(
                            infodata["event"],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ButtonBar(
                          children: [
                            TextButton(
                              child: const Text('EDIT'),
                              onPressed: () {
                                Navigator.pushNamed(context, Routers.update, arguments: 
                                {
                                  "argevent":infodata["event"],
                                  "id":infodata.id,
                                }
                                
                                );
                              },
                            ),
                            TextButton(
                              child: const Text('DELETE'),
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .doc("info/${infodata.id}")
                                    .delete();
                              },
                            )
                          ],
                        )
                      ]));
                },
              );
            }
            return Container();
          },
        ));
  }
}
