import 'package:fitness_provider/CustomFolder/customlistactivities.dart';
import 'package:fitness_provider/CustomFolder/custommenuactivities.dart';
import 'package:fitness_provider/Navigation/TopNavigationBar.dart';
import 'package:fitness_provider/Provider/alldata.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  DateTime selectedDate = DateTime.now();
  CalendarController _calendarController;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              // padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: <Widget>[
                  TopBar(),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                      height: 200.0,
                      child: SingleChildScrollView(
                        child: TableCalendar(
                          calendarController: _calendarController,
                          initialCalendarFormat: CalendarFormat.twoWeeks,
                          calendarStyle: CalendarStyle(
                            todayColor: Colors.deepPurple,
                            selectedColor: Colors.redAccent,
                          ),
                          headerStyle: HeaderStyle(
                            formatButtonShowsNext: false,
                            centerHeaderTitle: true,
                          ),
                          onDaySelected: (date, events) {
                            setState(() {
                              selectedDate = date;
                            });
                          },
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Provider.of<FitnessData>(context).isDarkModeOn
                        ? Color(0xFF000066)
                        : Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("ACTIVITIES",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                )),
                            FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "see all",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomActivities(
                            activitydetails: Provider.of<FitnessData>(context)
                                .fitnessactivity
                                .where((p) =>
                                    DateFormat.yMMMd().format(p.date) ==
                                    (DateFormat.yMMMd().format(selectedDate)))
                                .toList()),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Menu",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                )),
                            FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "see all",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomMenu()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
