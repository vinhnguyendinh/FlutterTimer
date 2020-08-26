import 'package:flutter/material.dart';

class TimeContent extends StatelessWidget {
  final String time;
  final String label;

  TimeContent({this.time, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 54,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
