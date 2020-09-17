import 'package:fitness_provider/Provider/alldata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMenu extends StatefulWidget {
  @override
  _AddMenuState createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  List<IconData> priorities = [
    Icons.access_alarm,
    Icons.people,
    Icons.directions_run
  ];
  var selectedValue = Icons.access_alarm;
  @override
  Widget build(BuildContext context) {
    String newTaskTitle1;
    String newTaskTitle2;

    IconData icons;
    icons = selectedValue;
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
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: false,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle1 = newText;
              },
            ),
            TextField(
              autofocus: false,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle2 = newText;
              },
            ),
            DropdownButton(
                items: priorities.map((IconData dropDownStringItem) {
                  return DropdownMenuItem<IconData>(
                    value: dropDownStringItem,
                    child: Icon(dropDownStringItem),
                  );
                }).toList(),
                value: selectedValue,
                onChanged: (valueSelectedByUser) {
                  setState(() {
                    debugPrint('User selected $valueSelectedByUser');
                    this.selectedValue = valueSelectedByUser;
                  });
                }),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                Provider.of<FitnessData>(context)
                    .addMenu(newTaskTitle1, newTaskTitle2, icons);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
