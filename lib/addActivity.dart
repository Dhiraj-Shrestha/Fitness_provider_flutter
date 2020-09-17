import 'package:fitness_provider/Provider/alldata.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AddActivity extends StatefulWidget {
  @override
  _AddActivityState createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  List<IconData> priorities = [
    Icons.access_alarm,
    Icons.people,
    Icons.directions_run
  ];
  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
  DateTime currentdate = DateTime.now();
  void showToast() {
    Fluttertoast.showToast(
      msg: 'Please enter all given fields',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
    );
  }

  Future<Null> _selectdate(BuildContext context) async {
    final DateTime _seldate = await showDatePicker(
      context: context,
      initialDate: currentdate,
      firstDate: currentdate,
      lastDate: currentdate.add(Duration(
        days: 365,
      )),
    );
    if (_seldate != null) {
      setState(() {
        currentdate = _seldate;
      });
    }
  }

  var selectedValue = Icons.access_alarm;
  String newTaskTitle1;
  String newTaskTitle2;
  IconData icons;

  // String _formattedate = new DateFormat.yMMMd().format(_dateTime);

  // DateTime currentdate = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    // String _formattedate = new DateFormat.yMMMd().format(_dateTime);

    icons = selectedValue;
    var displayDate = DateFormat.yMMMd().format(currentdate);
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Activity',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Activity',
              ),
              autofocus: false,
              onChanged: (newText) {
                newTaskTitle1 = newText;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Details',
              ),
              autofocus: false,
              onChanged: (newText) {
                newTaskTitle2 = newText;
                icons = Icons.access_alarm;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text("Select Date: "),
                SizedBox(
                  width: 10.0,
                ),
                FlatButton(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.lightBlue,
                    child: Text(dateFormat.format(selectedDate)),
                  ),
                  onPressed: () async {
                    final selectedDate = await _selectDateTime(context);
                    if (selectedDate == null) return;

                    print(selectedDate);

                    final selectedTime = await _selectTime(context);
                    if (selectedTime == null) return;
                    print(selectedTime);

                    setState(() {
                      this.selectedDate = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                    });
                  },
                  // onPressed: () {
                  //   _selectdate(context);
                  //   // showDatePicker(
                  //   //         context: context,
                  //   //         initialDate: currentdate,
                  //   //         // _dateTime == null ? _currentdate : _dateTime,
                  //   //         firstDate: DateTime(2001),
                  //   //         lastDate: DateTime(2022))
                  //   //     .then((date) {
                  //   //   setState(() {
                  //   //     currentdate = date;
                  //   //   });
                  //   // });
                  // },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  Text(
                    "Select Icon",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: DropdownButton(
                        focusColor: Colors.green,
                        dropdownColor: Theme.of(context).cardTheme.color,
                        items: priorities.map((IconData dropDownStringItem) {
                          return DropdownMenuItem<IconData>(
                            value: dropDownStringItem,
                            child: Icon(dropDownStringItem),
                          );
                        }).toList(),
                        value: selectedValue,
                        onChanged: (valueSelectedByUser) {
                          // FocusManager.instance.primaryFocus.unfocus();
                          setState(() {
                            this.selectedValue = valueSelectedByUser;
                          });
                        }),
                  ),
                ],
              ),
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                if (newTaskTitle1 == null || newTaskTitle2 == null) {
                  showToast();
                } else {
                  Provider.of<FitnessData>(context).addActivity(
                      newTaskTitle1, newTaskTitle2, icons, selectedDate);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<TimeOfDay> _selectTime(BuildContext context) {
    final now = DateTime.now();

    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
  }

  Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
}
