import 'package:medikate3/Allergy.dart';
import 'package:medikate3/Task.dart';
import 'package:medikate3/TaskDetail.dart';
import 'package:medikate3/AllergyDetail.dart';


class Patient{

  int id;
  int bloodSugar;
  int temp;
  AllergyDetail allergies;
  
  TaskDetail future;
  TaskDetail past;
  // Status status;
Patient(this.id, this.bloodSugar, this.temp, this.allergies, this.future, this.past);
  


}