import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekram_project_dashboardadmin/models/appColors.dart';
import 'package:ekram_project_dashboardadmin/models/reqestsModels.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';


class Reqestswidget extends StatelessWidget {
  const Reqestswidget({super.key});


  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    final Stream<QuerySnapshot> _ReqestsStream = FirebaseFirestore.instance.collection('Supscription').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _ReqestsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor,),
          );
        }
          if(snapshot.data!.docs.isEmpty){
            return Center(child: Text(' No Requste Found'));
          }
        if(snapshot.data != null){
          return
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  //shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context , index){
                    ReqestsModels reqestsModels =ReqestsModels(
                      isSee: snapshot.data!.docs[index]["isSee"],
                      status:snapshot.data!.docs[index]['status'] ,
                      CertificateNumber: snapshot.data!.docs[index]['CertificateNumber'] ,
                      clinicName: snapshot.data!.docs[index]['clinicName'] ,
                      licenseImage: snapshot.data!.docs[index]['licenseImage'] ,
                      phoneNumber: snapshot.data!.docs[index]['phoneNumber'] ,


                    );

                   return Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                     children: [
                       SingleChildScrollView(
                         scrollDirection:Axis.horizontal ,
                         child:

                         Container(
                           padding: EdgeInsets.all(8.0),
                           height: MediaQuery.of(context).size.height/8,
                           width: MediaQuery.of(context).size.width/1.28,
                           decoration: BoxDecoration(
                             border: Border.all(color: AppColors.greyColor.shade900),
                           ),
                           child: SingleChildScrollView(
                             scrollDirection: Axis.vertical,
                             child: Row(
                               children: [
                                 Expanded(
                                   flex: 1,
                                   child: Container(
                                     height: MediaQuery.of(context).size.height/10,
                                     width: MediaQuery.of(context).size.width/10,
                                     decoration: BoxDecoration(

                                         borderRadius: BorderRadius.circular(20),
                                         image: DecorationImage(image: CachedNetworkImageProvider(reqestsModels.licenseImage), fit: BoxFit.fill)
                                     ),
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.circular(20),
                                       child: InstaImageViewer(

                                         child: Image(
                                           image:Image.network(reqestsModels.licenseImage,fit:BoxFit.fill ,).image,
                                         ),
                                       ),
                                     ),
                                   ),
                                 ),

                                 Expanded(
                                   flex: 1,
                                   child: Container(

                                       child: Center(child: Text(reqestsModels.clinicName))),
                                 ),

                                 Expanded(
                                   flex: 1,
                                   child: Container(

                                       child: Center(child: Text(reqestsModels.CertificateNumber))),
                                 ),

                                 Expanded(
                                   flex: 1,
                                   child: Container(

                                       child: Center(child: Text(reqestsModels.phoneNumber))),
                                 ),

                                 Expanded(
                                   flex: 1,
                                   child: Container(

                                       child: Center(child: Text(reqestsModels.status.toString()))),
                                 ),

                                 Expanded(
                                   flex: 1,
                                   child: Container(

                                     child: ElevatedButton(onPressed: (){

                                     },
                                         style: ElevatedButton.styleFrom(
                                             backgroundColor:const Color.fromARGB(255, 65, 223, 70),
                                             elevation: 6
                                         ),
                                         child:Text("Accept")
                                     ),
                                   ),
                                 ),

                                 Expanded(
                                   flex: 1,
                                   child: Container(

                                     child: ElevatedButton(onPressed: (){

                                     },

                                         style: ElevatedButton.styleFrom(
                                             backgroundColor:Color.fromARGB(255, 230, 41, 34),
                                             elevation: 6
                                         ),
                                         child:Text("Delete")
                                     ),
                                   ),
                                 )

                               ],
                             ),
                           ),
                         ),
                       ),
                       SizedBox(
                         height: 30,
                       )
                     ],
                   );
                  })
          );
        }
          return Container();
        },
    );
  }
}