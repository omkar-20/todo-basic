import 'package:appointment/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../Dialog_box.dart';
import '../models/boxes.dart';
import '../provider/appointment_provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final box = Boxes.getData();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: size.height * 0.3,
          // width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: uiColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizeH10,
                  Text(
                    'BOOK',
                    style: headingStyle,
                  ),
                  Text('APPOINTMENT', style: headingStyle),
                  sizeH10,
                  const Text(
                    'Quickly Create Files',
                    style: TextStyle(color: Colors.white),
                  ),
                  sizeH20,
                  ElevatedButton(
                    onPressed: () {
                      showDialogBox(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: uiColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: const Text('Book Appointment'),
                  ),
                ],
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  'assets/images/appointment_image.jpg',
                ),
              ),
            ],
          ),
        ),
        sizeH20,
        const Text(
          'Appointment List',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          child: Column(
            children: [
              Consumer<AppointmentProvider>(
                builder: (context, value, child) {
                  return SizedBox(
                    height: size.height * 0.4,
                    child: ListView.builder(
                      //  padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                      shrinkWrap: true,
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.grey.shade200,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ListTile(
                                title: Text(
                                  value.box.get(index)!.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Text(dateTimeFormat(value.box.get(index)!.dateTime)),
                                subtitle: Text(value.box.get(index)!.type),
                              ),
                            ));
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  String dateTimeFormat(DateTime dateTime){
    return DateFormat('yyyy-MM-dd HH: ss a').format(dateTime);
  }
  showDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const DialogBox();
      },
    );
  }
}
