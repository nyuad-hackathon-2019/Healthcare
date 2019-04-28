import 'package:flutter/material.dart';
import 'package:medikate3/AllergyDetail.dart';
import 'package:medikate3/TaskDetail.dart';

class PastTasksCard extends StatelessWidget {
  TaskDetail detail;
  PastTasksCard(this.detail);
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
                        ),
                  )
                  .toList()),
    );
  }
}