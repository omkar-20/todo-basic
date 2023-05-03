import 'package:appointment/Constants/constants.dart';
import 'package:appointment/provider/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'models/boxes.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({Key? key}) : super(key: key);

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _type = TextEditingController();
  final box = Boxes.getData();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime currentDateTime = DateTime.now();

  Future<DateTime> _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        // _dateController.text = selected.toString();
      });
    }
    return selectedDate;
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  Future _selectDateTime(BuildContext context) async {
    final date = await _selectDate(context);
    final time = await _selectTime(context);

    setState(() {
      currentDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  String getDateTime() {
    return DateFormat('yyyy-MM-dd HH: ss a').format(currentDateTime);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter Details'),
      content: SingleChildScrollView(
        child: Column(

          children: [
            TextField(
              onChanged: (value) {},
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Your Name',
                focusedBorder: searchBorder,
                enabledBorder: searchBorder,
                contentPadding: fieldPadding,
              ),
            ),
            sizeH20,
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectDateTime(context);
                      _dateController.text = getDateTime();
                    }),
                hintText: 'dd/mm/yy',
                focusedBorder: searchBorder,
                enabledBorder: searchBorder,
                contentPadding: fieldPadding,
              ),
            ),
            sizeH20,
            TextField(
              controller: _age,
              decoration: InputDecoration(
                hintText: 'Enter Your age',
                focusedBorder: searchBorder,
                enabledBorder: searchBorder,
                contentPadding: fieldPadding,
              ),
            ),
            sizeH20,
            TextField(
              controller: _type,
              decoration: InputDecoration(
                hintText: 'Enter type',
                focusedBorder: searchBorder,
                enabledBorder: searchBorder,
                contentPadding: fieldPadding,
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (_nameController.text.isNotEmpty &&
                _dateController.text.isNotEmpty &&
                _age.text.isNotEmpty &&
                _type.text.isNotEmpty) {
              Provider.of<AppointmentProvider>(context, listen: false).addData(
                  _nameController.text,
                  currentDateTime,
                  _age.text,
                  _type.text);
              _nameController.clear();
              _dateController.clear();
              _age.clear();
              _type.clear();
              // print(box.get(0)?.name);
              Navigator.pop(context);
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Alert'),
                  content: const Text('Please enter all details'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: uiColor,
                        padding: const EdgeInsets.all(14),
                        child: const Text(
                          "Okay",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            // Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(backgroundColor: uiColor),
          child: const Text(
            'Add',
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: uiColor),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Back',
            )),
      ],
    );
  }
}
