import 'package:appointment/Database/all_appointments_database.dart';
import 'package:appointment/models/appointment_schedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpcomingList extends StatefulWidget {
  const UpcomingList({Key? key}) : super(key: key);

  @override
  State<UpcomingList> createState() => _UpcomingListState();
}

class _UpcomingListState extends State<UpcomingList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppointmentsData.allData.sortAppointments();
  }
//   void abc(){
//     AppointmentsData.allData.sortAppointments();
// }
  @override
  Widget build(BuildContext context) {
    //abc();
    List<AppointmentSchedule> upcomingAppointment=AppointmentsData.allData.upcomingAppointment;

    return Scaffold(
      body:  ListView.builder(
          itemCount: upcomingAppointment.length,
          itemBuilder:(context,index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(upcomingAppointment[index].name,style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                  trailing: Text(dateTimeFormat(upcomingAppointment[index].dateTime)),
                  subtitle: Text(upcomingAppointment[index].type),
                ),
              ),
            );
          }),
    );

  }
  String dateTimeFormat(DateTime dateTime){
    return DateFormat('yyyy-MM-dd HH: ss a').format(dateTime);
  }
}
