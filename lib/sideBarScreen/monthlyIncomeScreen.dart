import 'package:flutter/material.dart';

class monthlyIncomeScreen extends StatelessWidget {
  static const String routName ='\monthlyIncomeScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Text('الارباح الشهرية',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 36,
        ),
        ),
      ),
    );
  }
}