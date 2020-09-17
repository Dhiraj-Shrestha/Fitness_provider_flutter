import 'package:flutter/material.dart';

class FitnessDetails {
  final String activity;
  final String subactivity;
  final IconData icon;
  final DateTime date;
  FitnessDetails({this.activity, this.subactivity, this.icon, this.date});
}

class MenuDetails {
  final String menu;
  final String submenu;
  final IconData icon;
  MenuDetails({this.menu, this.submenu, this.icon});
}
