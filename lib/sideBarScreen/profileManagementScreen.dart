import 'package:flutter/material.dart';

class profileManagementScreen extends StatelessWidget {
   static const String routName ='\profileManagementScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Text('ادارة الملف الشخصي',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 36
        ),
        ),
      ),
    );
  }
}