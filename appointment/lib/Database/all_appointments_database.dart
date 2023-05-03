import '../models/appointment_schedule.dart';
import '../models/boxes.dart';

class AppointmentsData {
  static AppointmentsData allData = AppointmentsData();
  final box = Boxes.getData();

  List<AppointmentSchedule> upcomingAppointment = [];
  List<AppointmentSchedule> todayAppointment = [];
  List<AppointmentSchedule> pastAppointment = [];

  void sortAppointments() {
    DateTime current = DateTime.now();
    upcomingAppointment = [];
    todayAppointment = [];
    pastAppointment = [];
    DateTime newDateTime =
        DateTime(current.year, current.month, current.day, 23, 59);
    for (int i = 0; i < box.length; i++) {
      AppointmentSchedule? appointment = box.getAt(i);
      if (current.compareTo(appointment!.dateTime) >= 0) {
        pastAppointment.add(appointment);
      } else {
        bool isToday =
            newDateTime.compareTo(appointment.dateTime) > 0 ? true : false;
        if (isToday) {
          todayAppointment.add(appointment);
        } else {
          upcomingAppointment.add(appointment);
        }
      }
    }
  }
}
