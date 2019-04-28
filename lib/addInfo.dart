import 'package:flutter/material.dart';
import 'package:medikate3/Patient.dart';
import 'package:medikate3/Task.dart';
import 'package:medikate3/main.dart';

class addInfo extends StatefulWidget{
  Patient p;
  addInfo(this.p);
    List<Task> currentTasks;
  // addTask(this.currentTasks);
  @override
  State<StatefulWidget> createState() {
    return _addInfo(p);
  }


}

class _addInfo extends State<addInfo>{
  List<Task> currentTasks;
  Patient p;
  _addInfo(this.p);
  //add a task
  // String name;
  final bloodController = TextEditingController();
  final tempController = TextEditingController();
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
        body: Column(
          children: <Widget>[
            Padding(child: typer('blood sugar', bloodController, '', TextInputType.text),
            padding: EdgeInsets.only(top: 130),),
            
            typer('temperature', tempController, '', TextInputType.text),
            typer('9:00 AM 12-04-2019', dateController, '', TextInputType.text),
            RaisedButton(
              child: Text('add'),
              onPressed: (){
                Task blood = new Task('Blood Sugar: ' + bloodController.text, dateController.text, false, false);
                Task temp = new Task('Temperature: ' + tempController.text, dateController.text, false, false);
                p.past.tasks.add(blood);
                p.past.tasks.add(temp);

                var bloodInt = int.parse(bloodController.text);
                assert(bloodInt is int);
                p.bloodSugar = bloodInt;

                var tempInt = int.parse(tempController.text);
                assert(tempInt is int);
                p.temp = tempInt;
                
                Navigator.push(
           context, MaterialPageRoute(builder: (context) => MyApp(p)));


              },
            )
          ],
        ),
      ),
    );
  }


  
}