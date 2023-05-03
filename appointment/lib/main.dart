import 'package:appointment/models/appointment_schedule.dart';
import 'package:appointment/provider/appointment_provider.dart';
import 'package:appointment/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AppointmentScheduleAdapter());
  await Hive.openBox<AppointmentSchedule>('details');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppointmentProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const HomePage(),
      ),
    );
  }
}
