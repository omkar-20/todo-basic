import 'package:appointment/Constants/constants.dart';
import 'package:appointment/views/past_list.dart';
import 'package:appointment/views/today_list.dart';
import 'package:appointment/views/upcoming_list.dart';
import 'package:flutter/material.dart';

class AllAppointments extends StatelessWidget {
  const AllAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom:  TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: uiColor,
            indicatorColor: uiColor,
            tabs: const [
              Tab(text: 'Upcoming'),
              Tab(text: 'Today'),
              Tab(text: 'Past'),
            ],
          ),
          backgroundColor:Colors.white ,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const [Text(
              'My Appointments',
              style: TextStyle(color: Colors.black),
            ),
              Divider(
                thickness: 2,
              ),
            ],
          ),


        ),
        body:  const TabBarView(
          children: [
              UpcomingList(),
              TodayList(),
              PastList(),

          ],
        ),
      ),
    );
  }
}
