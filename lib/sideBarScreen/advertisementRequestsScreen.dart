import 'package:flutter/material.dart';

import '../models/appColors.dart';

class advertisementRequestsScreen extends StatelessWidget {


  static const String routName ='\advertisementRequestsScreen';

  Widget _rowHeader(String text , int flex) {
    return Expanded(
        flex: flex,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyColor),
              color: AppColors.primaryColor
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,
              style: TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16
              ),
            ),
          ),
        ));}


    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text('طلبات الاعلانات',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 36
                ),
              ),
            ),
            Row(
              children: [
                _rowHeader('Advertisement Image', 3),
                _rowHeader('clinic Name', 2),
                _rowHeader('Subscription Number', 3),
                _rowHeader('Title', 1),
                _rowHeader('Description', 3),
                _rowHeader('Date', 1),
                _rowHeader('Accept', 1),
                _rowHeader('Delete ', 1),
              ],
            ),
          ],
        ),
      );

  }}