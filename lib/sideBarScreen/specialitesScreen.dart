import 'package:ekram_project_dashboardadmin/models/appColors.dart';
import 'package:ekram_project_dashboardadmin/sideBarScreen/widget/Specialites/addSpecialites.dart';
import 'package:ekram_project_dashboardadmin/sideBarScreen/widget/Specialites/viewSpecialtiesWidget.dart';
import 'package:flutter/material.dart';

class Specialitesscreen extends StatefulWidget {
  static const String routName ='\Specialitesscreen';

  @override
  State<Specialitesscreen> createState() => _SpecialitesscreenState();
}

class _SpecialitesscreenState extends State<Specialitesscreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
           Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(10),
                    child: Text('Specialies Management ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 36
                    ),
                    ),
                  ),
                 
                 Padding(
               padding: const EdgeInsets.all(8.0),
               child: Divider(
                color: AppColors.greyColor.shade100,
                           )),
          Addspecialites(),
            Padding(
               padding: const EdgeInsets.all(8.0),
               child: Divider(
                color: AppColors.greyColor.shade100,
                           )),
          ViewSpecialiesWidget(),
           Padding(
               padding: const EdgeInsets.all(8.0),
               child: Divider(
                color: AppColors.greyColor.shade100,
                           )),

                          
                           
        ],)
        ,
    );
  }
}

















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ekram_project_dashboardadmin/models/appColors.dart';
// import 'package:ekram_project_dashboardadmin/sideBarScreen/widget/SpecialtiesWidget.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';



// class getSpecialitesWidget extends StatefulWidget {
//     // static const String routName ='\getSpecialitesWidget';
  
//   @override
//   State<getSpecialitesWidget> createState() => _getSpecialitesWidgetState();
// }

// class _getSpecialitesWidgetState extends State<getSpecialitesWidget> {

//   FirebaseStorage _storge =FirebaseStorage.instance;
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
 
//   late String specialtyName ;

//   dynamic _image;

  

//   //upload image from this pc
//    pickImage()async{
//     FilePickerResult? result = await FilePicker.platform.
//     pickFiles(allowMultiple: false , type: FileType.image);

//     if(result!=null){
//       setState(() {
//         _image = result.files.first.bytes;
      
//       });
//     }

//   }
//   //upload speialty image to storge in firebase 
//   _uploadspecialtyToStorge(dynamic image) async{
//    Reference ref= _storge.ref().child('Specialies');

//    UploadTask uploadTask = ref.putData(image);
//    TaskSnapshot snapshot = await uploadTask;
//    String downloadUrl =await snapshot.ref.getDownloadURL();

//    return downloadUrl;

//   }

//   uploadspecialty()async{
//     if(_formKey.currentState!.validate() && _image!=null){
//       EasyLoading.show();
//         String imageUrl = await _uploadspecialtyToStorge(_image);

//         await _firestore.collection("Specialties").doc().set({
//           'image': imageUrl,
//           'specialtyName':specialtyName,
//         }).whenComplete(() {
//           EasyLoading.dismiss();
//           setState(() {
//             _image = null;
//             _formKey.currentState!.reset();//clear the text field
//           });
//         });
//     }
//     else{

//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child:Form(
//         key:_formKey ,
//         child: 
           
          
//             Column(
//               children: [

//   SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     alignment: Alignment.topLeft,
//                     padding: EdgeInsets.all(10),
//                     child: Text('Specialies Management ',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black,
//                       fontSize: 36
//                     ),
//                     ),
//                   ),
                 
//                  Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Divider(
//                 color: AppColors.greyColor.shade100,
//                            ),
//              ),])),

//                 SingleChildScrollView(
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 140,
//                               width: 140,
//                               decoration: BoxDecoration(
//                                 color: AppColors.greyColor.shade100,
//                                 border: Border.all(
//                                   color: AppColors.greyColor.shade600
//                                 ),
//                                 //borderRadius: BorderRadius.circular(10)
//                               ),
//                               child:_image!=null 
//                               ? Image.memory(
//                                 _image,
//                                  fit: BoxFit.cover,
//                                  ) 
//                               : Center(child: Text('Specialies ')),
//                             ),
//                             SizedBox(height: 20,),
//                              ElevatedButton(
//                               onPressed: (){
//                                pickImage();
//                               }, 
//                             child: Text(' Upload Image'),
//                       )
//                           ],
//                         ),
//                       ),
//                        Material(
//                          child: Flexible(
//                               child: SizedBox(
//                                 width: 280,
//                                 child: TextFormField(
//                                   onChanged: (value){
//                                     specialtyName=value;
//                                   },
//                                   validator: (value){
//                                     if(value!.isEmpty){
//                                       return 'Please the specialty name must be not empty';
//                                     }
//                                     else{
//                                       return null;
//                                     }
//                                   },
//                                   decoration: InputDecoration(
//                                     labelText: 'Enter the specialty name',
                                  
//                                   )
//                                 ),
//                               ),
//                             ),
//                        ),
                          
//                       SizedBox(width: 30,),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Theme.of(context).primaryColor,
//                           elevation: 6
//                         ),
//                         onPressed: (){
//                           uploadspecialty();
//                         },
//                          child: Text('Save'),),
                       
         
//                     ],
//                   ),),
//                  Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Divider(
//                 color: AppColors.greyColor.shade100,
//               ),
//             ),
//                    Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 alignment: Alignment.topLeft,
//                 child: Text(
//                   'Specialies ',
//                   style: TextStyle(
//                     fontSize: 36,
//                     fontWeight: FontWeight.bold
//                   ),
//                 ),
//               ),
//             ),
//             SpecialitiesWidget(),
//               ],
//             ),
            
         
//       ),
      
//       );}}
      