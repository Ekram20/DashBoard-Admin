import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekram_project_dashboardadmin/models/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvertisementsWidget extends StatelessWidget {
  const AdvertisementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
     final Stream<QuerySnapshot> _AdvertisementsStream = FirebaseFirestore.instance.collection('Banners').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _AdvertisementsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor,),
          );
        }

        return GridView.builder(
          shrinkWrap: true,
          itemCount:snapshot.data!.size ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8
            ),
           itemBuilder: (context,index){
            final AdvertisementsData = snapshot.data!.docs[index];
            return Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(AdvertisementsData['image'],),
                ),
                //Text(AdvertisementsData['Banners']),
              ]
            );
           },
           );
      },
    );
  }
}