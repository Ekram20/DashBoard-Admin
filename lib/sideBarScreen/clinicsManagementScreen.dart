import 'package:flutter/material.dart';

class clinicsManagementScreen extends StatelessWidget {
   static const String routName ='\clinicsManagementScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Text('ادارة العيادات',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 36
        ),
        ),
      ),
    );
  }
}