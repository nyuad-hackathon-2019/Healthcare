


import 'package:flutter/material.dart';
import 'package:medikate3/AllergyDetail.dart';
import 'package:medikate3/Patient.dart';
import 'package:medikate3/TaskDetail.dart';
import 'package:medikate3/main.dart';

class FutureTasksCard extends StatelessWidget {
  TaskDetail detail;
  Patient p;
  FutureTasksCard(this.detail, this.p);
  @override
  Widget build(BuildContext context) {
    return Container(
       width: MediaQuery.of(context).size.width,
      child:
          Column(
              children: detail.tasks
                  .map(
                    (task) => Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Dismissible(
                            child: Card(
                              // child: Center(
                            child: Column(
                              children: <Widget>[
                                
                                Align(child:Text(task.name +"", style: TextStyle(
                                  color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold,
                                ),), alignment:Alignment.centerLeft),
                                Align(child:Text(task.date, style: TextStyle(
                                  color: Colors.black54, fontSize: 13.5, fontWeight: FontWeight.bold,
                                  )), alignment:Alignment.centerRight),
                                // Text(task.date)
                              ],
                            // ),
                          )),
                          key: Key(task.name + task.date),
                          onDismissed: (direction){
                              p.past.tasks.add(task);
                              p.future.tasks.remove(task);
                              Navigator.push(
           context, MaterialPageRoute(builder: (context) => MyApp(p)));

                          },
                          )
                        ),
                  )
                  .toList()),
    );
  }
}
