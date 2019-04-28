import 'package:flutter/material.dart';
import 'package:medikate3/Patient.dart';
import 'package:medikate3/Task.dart';
import 'package:medikate3/main.dart';

class addTask extends StatefulWidget{
  Patient p;
  addTask(this.p);
    List<Task> currentTasks;
  // addTask(this.currentTasks);
  @override
  State<StatefulWidget> createState() {
    return _addTask(p);
  }


}

class _addTask extends State<addTask>{
  List<Task> currentTasks;
  Patient p;
  _addTask(this.p);
  //add a task
  // String name;
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  // String date;

  
  Widget typer(String text, TextEditingController myController, String pref,
      TextInputType keyboard) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        controller: myController,
        // textDirection: TextDirection.rtl,
        autocorrect: false,
        autofocus: true,
        // textAlign: TextAlign.right,
        keyboardType: keyboard,
        decoration: new InputDecoration(
          border: OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true,
          labelText: text,
          prefixText: pref,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 200),
              child:  typer('task name', nameController, '', TextInputType.text),),
           
            typer('9:00 AM 12-04-2019', dateController, '', TextInputType.text),
            RaisedButton(
              child: Text('add'),
              onPressed: (){
                Task t = new Task(nameController.text, dateController.text, false, false);
                p.future.tasks.add(t);
                Navigator.push(
           context, MaterialPageRoute(builder: (context) => MyApp(p)));


              },
            )
          ],
        ),)
      ),
    );
  }


  
}