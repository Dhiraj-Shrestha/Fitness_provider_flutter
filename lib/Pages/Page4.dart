import 'package:fitness_provider/Navigation/TopNavigationBar.dart';
import 'package:fitness_provider/Provider/alldata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    final bool mode = Provider.of<FitnessData>(context).isDarkModeOn;
    return SafeArea(
      child: Container(
          child: Column(
        children: <Widget>[
          TopBar(),
          Center(
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xffFDCF09),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/Dhiraj.jpg'),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Dark Mode',
                      style: TextStyle(fontSize: 24),
                    ),
                    Switch(
                        value: mode,
                        onChanged: (bool val) {
                          Provider.of<FitnessData>(context).updateTheme();
                        }),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(color: Colors.black),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.home),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Address: Itahari, Sunsari',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(color: Colors.black),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.phone),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '+977 9816367276',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(color: Colors.black),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.help_outline),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Help',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
