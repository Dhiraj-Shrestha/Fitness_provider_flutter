import 'package:fitness_provider/Pages/Page1.dart';
import 'package:fitness_provider/Pages/Page2.dart';
import 'package:fitness_provider/Pages/Page3.dart';
import 'package:fitness_provider/Pages/Page4.dart';
import 'package:fitness_provider/addActivity.dart';
import 'package:fitness_provider/addMenu.dart';
import 'package:fitness_provider/constants.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/alldata.dart';

void main() => runApp(
      ChangeNotifierProvider<FitnessData>(
        builder: (BuildContext context) => FitnessData(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    cardTheme: CardTheme(color: Color(0xFF000099)),
    iconTheme: IconThemeData(color: Colors.blue),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.blue,
      ),
    ),
  );
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.blue,
    scaffoldBackgroundColor: Color(0xFF000099),
    cardTheme: CardTheme(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<FitnessData>(context).isDarkModeOn
          ? darkTheme
          : lightTheme,
      home: Child(),
    );
  }
}

class Child extends StatefulWidget {
  Child({Key key}) : super(key: key);

  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  int _cIndex = 0;
  final tabs = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[_cIndex],

        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,

          closeManually: false,
          marginRight: MediaQuery.of(context).size.width / 2 - 10,
          marginBottom: 50,
          // curve: Curves.bounceIn,
          // overlayColor: Colors.black,
          overlayOpacity: 0.5,

          backgroundColor: Provider.of<FitnessData>(context).isDarkModeOn
              ? Color(0xFFFFCCCC)
              : Color(0xFF0000CC),

          elevation: 8.0,
          // shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Icon(Icons.accessibility),
              backgroundColor: Colors.red,
              label: 'Add Activity',
              labelStyle: TextStyle(fontSize: 18.0),

              // onTap: () => showModalBottomSheet(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return Text("frddtgdtg");
              //   },
              // ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                            child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: AddActivity(),
                        )));
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.brush),
              backgroundColor: Colors.blue,
              label: 'Add Menu',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                            child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: AddMenu(),
                        )));
              },
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //     backgroundColor: Provider.of<FitnessData>(context).isDarkModeOn
        //         ? Color(0xFFFFCCCC)
        //         : Color(0xFF0000CC),
        //     onPressed: () {},
        //     child: Icon(
        //       Icons.add,
        //     )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            currentIndex: _cIndex,
            type: BottomNavigationBarType.fixed,
            iconSize: 35.0,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard, color: kLightThemeColor),
                title: new Text(
                  '',
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.alarm_add, color: kLightThemeColor),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.insert_chart, color: kLightThemeColor),
                  title: new Text('')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: kLightThemeColor),
                  title: new Text('')),
            ],
            onTap: (index) {
              setState(() {
                _cIndex = index;
              });
            },
          ),
        ),
        // bottomNavigationBar: BottomAppBar(
        //     elevation: 10,
        //     color: Colors.white,
        //     shape: CircularNotchedRectangle(),
        //     child: Container(
        //         height: 80,
        //         child: Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: <Widget>[
        //               Icon(Icons.home, size: 40.0, color: Colors.grey),
        //               Icon(Icons.alarm_add, size: 40.0, color: Colors.grey),
        //               SizedBox.shrink(),
        //               Icon(Icons.insert_chart,
        //                   size: 40.0, color: Colors.grey),
        //               Icon(Icons.person_outline,
        //                   size: 40.0, color: Colors.grey)
        //             ],
        //           ),
        //         ))),
      ),
    );
  }
}
