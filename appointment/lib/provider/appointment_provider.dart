import 'package:appointment/models/appointment_schedule.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/boxes.dart';

class AppointmentProvider extends ChangeNotifier{
   final box=Boxes.getData();
  // Box<AppointmentSchedule> box1=Hive.box<AppointmentSchedule>('details');

   void addData(String name, DateTime dateTime, String age,String type){
     box.add(AppointmentSchedule(name: name, dateTime: dateTime, age: age, type: type));
     notifyListeners();
   }
}