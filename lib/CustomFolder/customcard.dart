import 'package:fitness_provider/Provider/alldata.dart';
import 'package:fitness_provider/Widgets/linearbar.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key key, @required this.activitydetails}) : super(key: key);

  final activitydetails;

  // final String running;
  // final String totalrunning;

  // CustomCard({this.running, this.totalrunning});

  @override
  Widget build(BuildContext context) {
    return activitydetails.length == 0
        ? Text("empty")
        : ListView.builder(
            itemCount: activitydetails.length,
            itemBuilder: (BuildContext context, i) {
              return Container(
                height: 300,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              activitydetails[i].icon,
                              size: 38,
                              color:
                                  Provider.of<FitnessData>(context).isDarkModeOn
                                      ? Color(0xFF000066)
                                      : Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(DateFormat.yMMMd()
                                        .format(activitydetails[i].date)
                                        .toString()),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Text(DateFormat.jm()
                                        .format(activitydetails[i].date)
                                        .toString()),
                                  ],
                                ),
                                Text(
                                  activitydetails[i].activity,
                                  style: TextStyle(
                                    color: Provider.of<FitnessData>(context)
                                            .isDarkModeOn
                                        ? Color(0xFF000066)
                                        : Colors.white,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: '2500',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Provider.of<FitnessData>(context)
                                              .isDarkModeOn
                                          ? Color(0xFF000066)
                                          : Colors.white,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'm',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20)),
                                    ],
                                  ),
                                ),
                                Text(
                                  activitydetails[i].subactivity,
                                  style: TextStyle(
                                    color: Provider.of<FitnessData>(context)
                                            .isDarkModeOn
                                        ? Color(0xFF000066)
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        HorizontalProgress(
                          percentage: 0.5,
                        ),
                        RichText(
                          text: TextSpan(
                            text: '4000',
                            style: TextStyle(
                              fontSize: 26,
                              color:
                                  Provider.of<FitnessData>(context).isDarkModeOn
                                      ? Color(0xFF000066)
                                      : Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'm',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                            ],
                          ),
                        ),
                        Text("needed to reach your goal",
                            style: TextStyle(color: Colors.grey, fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              );
            });
  }
}
