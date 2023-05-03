import 'package:appointment/Database/all_appointments_database.dart';
import 'package:appointment/models/appointment_schedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PastList extends StatefulWidget {
  const PastList({Key? key}) : super(key: key);

  @override
  State<PastList> createState() => _PastListState();
}

class _PastListState extends State<PastList> {

  @override
  void initState(){
    super.initState();
    AppointmentsData.allData.sortAppointments();

  }
  @override
  Widget build(BuildContext context) {
    List<AppointmentSchedule> pastAppointment=AppointmentsData.allData.pastAppointment;
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
          itemCount: pastAppointment.length,
          itemBuilder: ( context,index){
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(pastAppointment[index].name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),),
                  trailing: Text(dateFormat(pastAppointment[index].dateTime)),
                  subtitle: Text(pastAppointment[index].type),
                ),
              ),
            );
          }
      )
    );

  }
  String dateFormat(DateTime dateTime){
    return DateFormat('yyyy-MM-dd HH: ss a').format(dateTime);
  }
}
