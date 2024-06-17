import 'package:flutter/material.dart';

class PowerManagementScreen extends StatelessWidget {
   static const String routName ='\powerManagementScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Text('ادارة الصلاحيات',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 36
        ),
        ),
      ),
    );
  }
}