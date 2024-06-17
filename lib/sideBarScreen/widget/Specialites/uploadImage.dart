import 'package:ekram_project_dashboardadmin/models/appColors.dart';
import 'package:flutter/material.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 400.0,
            width: MediaQuery.of(context).size.width,
            color: AppColors.greyColor.shade400,
            child: Row(
             children: [
              Icon(Icons.add)
             ], 
            ),
          )
        ],
      ),
    );
  }
}