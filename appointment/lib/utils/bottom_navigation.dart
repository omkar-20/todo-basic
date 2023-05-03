// import 'package:appointment/views/home_page.dart';
// import 'package:flutter/material.dart';
//
// import '../views/all_appointments.dart';
//
// class bottomNavigation extends StatefulWidget {
//   const bottomNavigation({Key? key}) : super(key: key);
//
//   @override
//   State<bottomNavigation> createState() => _bottomNavigationState();
// }
//
// class _bottomNavigationState extends State<bottomNavigation> {
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _children[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         //  type: BottomNavigationBarType.shifting,
//         selectedFontSize: 20,
//         selectedIconTheme: const IconThemeData(color: Color(0xFF06464e), size: 40),  selectedItemColor: const Color(0xFF06464e),
//         selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
//         // iconSize: 40,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.event_note_outlined), label: 'Appointment'),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
// }
