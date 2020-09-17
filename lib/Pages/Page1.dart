import 'package:fitness_provider/CustomFolder/customcard.dart';

import 'package:fitness_provider/Navigation/TopNavigationBar.dart';
import 'package:fitness_provider/Provider/alldata.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with TickerProviderStateMixin {
  List<Widget> _tabTwoParameters() => [
        Tab(
          child: Text("Today"),
        ),
        Tab(
          child: Text("Weekly"),
        ),
        Tab(
          child: Text("Monthly"),
        ),
        Tab(
          child: Text("Yearly"),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  TopBar(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            TabBar(
              controller: tabController,
              tabs: _tabTwoParameters(),
              labelColor: Theme.of(context).textTheme.bodyText1.color,
            ),
            SizedBox(
              height: 40,
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
                  child: Column(
                    children: [
                      Container(
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
                            Container(
                              height: 320,
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  CustomCard(
                                      activitydetails:
                                          Provider.of<FitnessData>(context)
                                              .fitnessactivity
                                              .where((p) =>
                                                  DateFormat.yMMMd()
                                                      .format(p.date) ==
                                                  (DateFormat.yMMMd()
                                                      .format(DateTime.now())))
                                              .toList()),
                                  // .where((p) =>
                                  //     p.date.day ==
                                  //     (DateTime.now().day))
                                  // .toList()),
                                  CustomCard(
                                      activitydetails:
                                          Provider.of<FitnessData>(context)
                                              .fitnessactivity
                                              .where((p) =>
                                                  DateFormat.yMMMMEEEEd()
                                                      .format(p.date) ==
                                                  (DateFormat.yMMMMEEEEd()
                                                      .format(DateTime.now())))
                                              .toList()),
                                  // .where((p) =>
                                  //     p.date.day ==
                                  //     (DateTime.now().weekday))
                                  // .toList()),
                                  CustomCard(
                                      activitydetails:
                                          Provider.of<FitnessData>(context)
                                              .fitnessactivity
                                              .where((p) =>
                                                  DateFormat.yMMM()
                                                      .format(p.date) ==
                                                  (DateFormat.yMMM()
                                                      .format(DateTime.now())))
                                              .toList()),
                                  CustomCard(
                                      activitydetails:
                                          Provider.of<FitnessData>(context)
                                              .fitnessactivity
                                              .where((p) =>
                                                  DateFormat.y()
                                                      .format(p.date) ==
                                                  (DateFormat.y()
                                                      .format(DateTime.now())))
                                              .toList()),
                                ],
                              ),

                              // .allmenu
                              // .where((p) => p.menu
                              //     .toLowerCase()
                              //     .contains("break".toLowerCase()))
                              // .toList()),
                              // ),
                            ),
                          ],
                        ),
                      ),
                      // CustomCard(),
                    ],
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
