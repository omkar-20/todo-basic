import 'package:appointment/Database/all_appointments_database.dart';
import 'package:appointment/models/appointment_schedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayList extends StatefulWidget {
  const TodayList({Key? key}) : super(key: key);

  @override
  State<TodayList> createState() => _TodayListState();
}

class _TodayListState extends State<TodayList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppointmentsData.allData.sortAppointments();
  }
  @override
  Widget build(BuildContext context) {
    List<AppointmentSchedule> todayAppointment=AppointmentsData.allData.todayAppointment;
    return  Scaffold(
      body: ListView.builder(
        itemCount: todayAppointment.length,
          itemBuilder:(context,index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(todayAppointment[index].name,style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                  trailing: Text(dateTimeFormat(todayAppointment[index].dateTime)),
                  subtitle: Text(todayAppointment[index].type),
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
