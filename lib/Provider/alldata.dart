import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dataconstraint.dart';

class FitnessData extends ChangeNotifier {
  bool isDarkModeOn = false;

  void updateTheme() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }

  void addMenu(tasktitle1, tasktitle2, icondetails) {
    var menu =
        MenuDetails(menu: tasktitle1, submenu: tasktitle2, icon: icondetails);
    allmenu.add(menu);
    notifyListeners();
  }

  void addActivity(tasktitle1, tasktitle2, icondetails, date) {
    var menu = FitnessDetails(
        activity: tasktitle1,
        subactivity: tasktitle2,
        icon: icondetails,
        date: date);
    fitnessactivity.add(menu);
    notifyListeners();
  }

  List<FitnessDetails> fitnessactivity = [
    // FitnessDetails(
    //   activity: 'Running',
    //   subactivity: 'run 5 km a day',
    //   icon: Icons.people,
    // ),
    // FitnessDetails(
    //   activity: 'Walking',
    //   subactivity: 'Walk 5 km a day',
    //   icon: Icons.directions_run,
    // ),
    // FitnessDetails(
    //   activity: 'Drinking',
    //   subactivity: 'Drink 5 L water a day',
    //   icon: Icons.local_drink,
    // ),
  ];

  List<MenuDetails> allmenu = [
    MenuDetails(
      menu: 'Breakfast',
      submenu: 'eat healthy',
      icon: Icons.menu,
    ),
    MenuDetails(
      menu: 'Breakfast',
      submenu: 'eat healthy',
      icon: Icons.menu,
    ),
    MenuDetails(
      menu: 'Breakfast',
      submenu: 'eat healthy',
      icon: Icons.menu,
    ),
    MenuDetails(
      menu: 'Breakfast',
      submenu: 'eat healthy',
      icon: Icons.menu,
    ),
  ];

  void addactivity(item) {
    fitnessactivity.add(item);
    notifyListeners();
  }
}
