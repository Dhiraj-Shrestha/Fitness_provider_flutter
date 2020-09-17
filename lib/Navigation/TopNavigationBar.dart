
import 'package:flutter/material.dart';


class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.dehaze,
            size: 30.0,
          ),
          Icon(
            Icons.show_chart,
            size: 30.0,
          ),
          
          IconButton(icon: Icon(Icons.add_alert), onPressed: () {}),
        ],
      ),
    );
  }
}
