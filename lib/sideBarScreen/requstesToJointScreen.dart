
import 'package:ekram_project_dashboardadmin/sideBarScreen/widget/reqestsWidget.dart';
import 'package:flutter/material.dart';

import '../models/appColors.dart';

class requsesToJointScreen extends StatelessWidget {
  
  static const String routName ='\requsesToJointScreen';


  @override
  Widget build(BuildContext context) {
    TableRow _tableRow =const TableRow(
      children: <Widget>[

        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text('license Image',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text('clinic Name',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text('Certificate Number',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text('Phone Number',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text('Status',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text('Acceptance',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text('Refused',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),),
          ),
        ),

    ]
    );


    dynamic width =MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(18),
                  child: Text('Requests To Joint Management ',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color:  AppColors.greyColor.shade700,
                    fontSize: 36
                  ),
                  ),
                ),

                Table(
                  border: TableBorder.all(),
                  defaultColumnWidth: FixedColumnWidth(width/9),
                  children:<TableRow> [
                    _tableRow
                  ],

                ),

            SizedBox(height: 40,),
            Reqestswidget(),
          ],
        ),
      ),
    );
  }
}