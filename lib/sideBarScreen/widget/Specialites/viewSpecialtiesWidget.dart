import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekram_project_dashboardadmin/models/appColors.dart';
import 'package:flutter/material.dart';
//read data from FireStore
//RealTime Read
class ViewSpecialiesWidget extends StatelessWidget {
  const ViewSpecialiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
      final Stream<QuerySnapshot> _SpecialtiesStream = FirebaseFirestore.instance.collection('Specialties').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _SpecialtiesStream,
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
             
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height /6,
                    width: MediaQuery.of(context).size.width/3,
                    child: Image.network(snapshot.data!.docs[index]['imageURL'],),
                  ),
                  Text(snapshot.data!.docs[index]['specialtieName']),
                  // Text(snapshot.data!.docs[index].id),
                  // Text(snapshot.data!.docs[index]['imageUrl']),
                  Container(
                                     
                    //padding: EdgeInsets.all(8),
                    color: Colors.grey.shade200,
                    child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(onPressed: (){
                             AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Delete',
                              desc: 'Are you sure to delete',
                               btnCancelOnPress: () {},
                               btnOkOnPress: () async {
                                await FirebaseFirestore.instance.collection("Specialties").doc().delete();
                               },
                              )..show();
                                  },
                        
                           icon:  Icon(Icons.delete, color: Colors.red,),),
                           IconButton(onPressed: (){},
                           icon: Icon(Icons.update_disabled, color:Colors.blue.shade400 ,),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
           },
           );
      },
    );
  }
}









// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ekram_project_dashboardadmin/models/appColors.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class SpecialitiesWidget extends StatelessWidget {
//   const SpecialitiesWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//      final Stream<QuerySnapshot> _SpecialtiesStream = FirebaseFirestore.instance.collection('Specialties').snapshots();
//     return StreamBuilder<QuerySnapshot>(
//       stream: _SpecialtiesStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(color: AppColors.primaryColor,),
//           );
//         }

//         return GridView.builder(
//           shrinkWrap: true,
//           itemCount:snapshot.data!.size ,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 6,
//             mainAxisSpacing: 8,
//             crossAxisSpacing: 8
//             ),
//            itemBuilder: (context,index){
//             final SpecialtiesData = snapshot.data!.docs[index];
//             return SingleChildScrollView(
//               // padding: EdgeInsets.symmetric(horizontal: 12),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height /6,
//                     width: MediaQuery.of(context).size.width/3,
//                     child: Image.network(SpecialtiesData['image'],),
//                   ),
//                   Text(SpecialtiesData['specialtyName']),
//                   Container(
                                     
//                     //padding: EdgeInsets.all(8),
//                     color: Colors.grey.shade200,
//                     child: SingleChildScrollView(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           IconButton(onPressed: (){
//                              AwesomeDialog(
//                               context: context,
//                               dialogType: DialogType.error,
//                               animType: AnimType.rightSlide,
//                               title: 'Delete',
//                               desc: 'Are you sure to delete',
//                                btnCancelOnPress: () {},
//                                btnOkOnPress: () async {
//                                 await FirebaseFirestore.instance.collection("Specialties").doc().delete();
//                                },
//                               )..show();
//                                   },
                        
//                            icon:  Icon(Icons.delete, color: Colors.red,),),
//                            IconButton(onPressed: (){},
//                            icon: Icon(Icons.update_disabled, color:Colors.blue.shade400 ,),)
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//            },
//            );
//       },
//     );
//   }
// }
