import 'package:appointment/Constants/constants.dart';
import 'package:appointment/models/boxes.dart';
import 'package:appointment/views/dash_board.dart';
import 'package:flutter/material.dart';
import 'all_appointments.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = Boxes.getData();
  int _index = 0;
  static const List<Widget> _children = [DashBoard(), AllAppointments()];
  String appBarTitle = 'Appointment App';
  AppBar? _appBar = AppBar(
    backgroundColor: Colors.white,
    title: const Text(
      'Appointment App',
      style: TextStyle(color: Colors.black),
    ),
    centerTitle: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar,
        bottomNavigationBar: BottomNavigationBar(
          //  type: BottomNavigationBarType.shifting,
          selectedFontSize: 20,
          selectedIconTheme: IconThemeData(color: uiColor, size: 25),
          selectedItemColor: uiColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          // iconSize: 40,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.event_note_outlined), label: 'Appointment'),
          ],
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
              if (_index == 1) {
                _appBar = null;
              } else {
                _appBar = AppBar(
                  backgroundColor: Colors.white,
                  title: const Text(
                    'Appointment App',
                    style: TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                );
              }
            });
          },
        ),
        body: _children[_index]);
  }
}
