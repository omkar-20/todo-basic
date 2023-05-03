

import 'package:hive/hive.dart';
part 'appointment_schedule.g.dart';

@HiveType(typeId:0)
class AppointmentSchedule extends HiveObject{
  AppointmentSchedule({required this.name, required this.dateTime, required this.age,  required this.type});
  @HiveField(0)
   String name;

  @HiveField(6)
   DateTime dateTime;

  @HiveField(2)
   String age;

  // @HiveField(3)
  //  String amount;

  @HiveField(4)
   String type;

}