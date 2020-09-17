import 'package:fitness_provider/Provider/alldata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var menudetails = Provider.of<FitnessData>(context).allmenu;

    return SingleChildScrollView(
      child: Container(
          height: 100,
          child: ListView.builder(
            itemCount: menudetails.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, i) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            // padding: EdgeInsets.all(18.0),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Icon(
                              menudetails[i].icon,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: <Widget>[
                            Text(menudetails[i].menu),
                            Text(menudetails[i].submenu),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text('RandomText'),
                ],
              );
            },
          )),
    );
  }
}
