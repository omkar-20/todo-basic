
import 'package:hive/hive.dart';

import 'appointment_schedule.dart';

class Boxes{
  static Box<AppointmentSchedule> getData(){
    return Hive.box<AppointmentSchedule> ('details');
  }
}