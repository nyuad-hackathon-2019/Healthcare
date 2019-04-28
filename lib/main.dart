import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medikate3/Allergy.dart';
import 'package:medikate3/AllergyCard.dart';
import 'package:medikate3/AllergyDetail.dart';
import 'package:medikate3/FutureTasksCard.dart';
import 'package:medikate3/Patient.dart';
import 'package:medikate3/Task.dart';
import 'package:medikate3/TaskDetail.dart';
import 'package:medikate3/addInfo.dart';
import 'package:medikate3/addTask.dart';
import 'package:medikate3/pastTasksCard.dart';
// import 'package:qrcode_reader/QRCodeReader.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
// import 'package:qrcode_reader/QRCodeReader.dart';

// import 'package:qrcode_reader/QRCodeReader.dart';
// import 'package:qrcode_reader/QRCodeReader.dart';
// import 'package:barcode_scan/barcode_scan.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  List<Allergy> allergiesList = [
    new Allergy(
      'penicilline',
    ),
    new Allergy(
      'Anesthesia',
    )
  ];
  AllergyDetail detail = new AllergyDetail('Allergies', allergiesList);

  List<Task> pastTasks = [
    new Task('change sheets', '9:10 AM 12-2-2019', true, false),
    new Task('3 dozes of magnesium', '11:00 AM 1-2-2019', true, false),
    new Task('brain surgery', '8:00 PM 10-1-2018', true, false),
  ];

  TaskDetail pastTasksDetails = new TaskDetail('Past', pastTasks);

  List<Task> futureTasks = [
    new Task('change sheets', '9:10 AM 28/4/2019', true, false),
    new Task('3 dozes of magnesium', '1:00 PM  3/5/2019', true, false),
    new Task('hand surgery', '5:00 PM  10/5/2019', true, false),
  ];

  TaskDetail futureTasksDetails = new TaskDetail('Future', futureTasks);

  Patient p =
      new Patient(12, 77, 37, detail, futureTasksDetails, pastTasksDetails);

  // runApp(home(p));
  runApp(MaterialApp(home: homeQR(p)));
}

class homeQR extends StatefulWidget {
  String texty = 'scan';
  Patient  p;
homeQR(this.p);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homeQR(p);
  }

}


class _homeQR extends State {
  String texty = 'scan';
  Patient  p;
  _homeQR(this.p);
  Duration timeout = new Duration(seconds: 3);
  Duration ms = Duration(milliseconds: 1);

  startTimeout(int milliseconds,  context) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, (){      
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyApp(p)));
    });
  }

  void handleTimeout() {
    // callback function
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text(texty),
          onPressed: () {
            // setState(()  {
            Future<String> futureString = new QRCodeReader().scan();

            
            
            startTimeout(3000, context);
            // Future<String> futureString = new QRCodeReader().scan();
          },
        ),
      ),
    );
  }
}

class home extends StatelessWidget {
  Patient p;
  home(this.p);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(p),
    );
  }
}

class MyApp extends StatefulWidget {
  Patient p;
  // List<Allergy> allergies;
  MyApp(this.p);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp(p);
  }
}

class _MyApp extends State<MyApp> {
  Patient p;

  _MyApp(this.p);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          backgroundColor: Colors.indigo,
          title: Text('MEDIKATE', style: TextStyle(color: Colors.white, fontSize: 30),)
        ),
        //DISPLAY BASIC INFO ABOUT PATIENT FIRST
        body: Container(
      padding: EdgeInsets.only(top: 40),
      // width: 200,
      child: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    p.id.toString(),
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    'Blood Sugar: ' + p.bloodSugar.toString() + " mg/dl",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    'Temperature: ' + p.temp.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Container(
              height: 50,
              color: Colors.indigoAccent,
              child: Center(
                child: Text(
                  p.allergies.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              )),
          AllergyCard(p.allergies),
          Container(
              height: 50,
              color: Colors.indigoAccent,
              child: Center(
                child: Text(
                  p.future.name + " Tasks",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              )),
          FutureTasksCard(p.future, p),
          Container(
              height: 50,
              color: Colors.indigoAccent,
              child: Center(
                child: Text(
                  p.past.name + " Tasks",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              )),
          PastTasksCard(p.past),
          Column(
            children: <Widget>[
              Container(
                //  width: 100,
                //height: 100,
                child: RaisedButton(
                  color: Colors.blueGrey,
                  child: Text('Add Task',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => addTask(p)));
                  },
                ),
              ),
              Container(
                //  width: 100,
                //height: 100,
                child: RaisedButton(
                  color: Colors.blueGrey,
                  child: Text('Add Measurement',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => addInfo(p)));
                  },
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
