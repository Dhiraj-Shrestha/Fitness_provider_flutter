import 'package:fitness_provider/Navigation/TopNavigationBar.dart';
import 'package:fitness_provider/Provider/alldata.dart';
import 'package:fitness_provider/Widgets/circularstar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            TopBar(),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("EXERCISE",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            )),
                        Container(
                          height: 250,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        CircularStat(),
                                        Column(
                                          children: <Widget>[
                                            StatActivities(
                                              staticon: Icons.directions_run,
                                              act: 'Running',
                                              subact: '2500',
                                            ),
                                            StatActivities(
                                              staticon: Icons.directions_subway,
                                              act: 'Running',
                                              subact: '2500',
                                            ),
                                            StatActivities(
                                              staticon: Icons.donut_small,
                                              act: 'Running',
                                              subact: '2500',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text("GOAL COMPLIANCE",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            )),
                        Container(
                          height: 150,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceAround,

                                      children: <Widget>[
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Column(
                                          children: <Widget>[
                                            StatActivities(
                                              staticon: Icons.directions_run,
                                              act: 'Running',
                                              subact: '2500',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
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

class StatActivities extends StatelessWidget {
  final String act;
  final String subact;
  final IconData staticon;

  StatActivities({this.act, this.subact, this.staticon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            staticon,
            size: 38,
            color: Provider.of<FitnessData>(context).isDarkModeOn
                ? Color(0xFF000066)
                : Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                act,
                style: TextStyle(
                  fontSize: 18,
                  color: Provider.of<FitnessData>(context).isDarkModeOn
                      ? Color(0xFF000066)
                      : Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: subact,
                  style: TextStyle(
                    color: Provider.of<FitnessData>(context).isDarkModeOn
                        ? Color(0xFF000066)
                        : Colors.white,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: ' km', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
