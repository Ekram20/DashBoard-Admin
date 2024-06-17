import 'package:flutter/material.dart';

class accountsManagementScreen extends StatelessWidget {
   static const String routName ='\accountsManagementScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Text('ادارة الحسابات',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 36
        ),
        ),
      ),
    );
  }
}