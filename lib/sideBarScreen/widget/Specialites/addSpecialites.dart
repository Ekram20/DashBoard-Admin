import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekram_project_dashboardadmin/models/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';





class Addspecialites extends StatefulWidget {
  const Addspecialites({super.key});

  @override
  State<Addspecialites> createState() => _AddspecialitesState();
}

class _AddspecialitesState extends State<Addspecialites> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>(); 
  TextEditingController specialtieName = TextEditingController();
  CollectionReference specialtie = FirebaseFirestore.instance.collection('Specialties');
 

   addspecialtie(BuildContext context) async{
        try{
           if(_formState.currentState!.validate()  ){
        // String imageUrl =await uploadImageToStorg(_imageFile);
          final existingItem = await specialtie.where('specialtieName', isEqualTo: specialtieName.text).get();
               if(existingItem.docs.isEmpty){
                EasyLoading.show();
                setState(() {
                  
                });
                specialtie.add({
              'specialtieName': specialtieName.text, 
              //'imageURL': imageUrl,
              
            })
            .whenComplete(() {
          EasyLoading.dismiss();
          setState(() {
              Fluttertoast.showToast(
              msg: "The specialty has been added successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Color.fromARGB(255, 83, 192, 73),
              textColor: Colors.white,
              fontSize: 16.0
    );
    
             _formState.currentState!.reset();//clear the text field
           // image = null;
           
          });
        });
               }
          else{
              AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'error',
                      desc: 'This specialty already existed',
                      btnCancelOnPress: () {},
                      // btnOkOnPress: () {},
                      )..show();

                      
          }
         }
         else {
        
         }
        
        }
         catch(e){
          print(e.toString());
         }
       
      }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                  child: Form(
                    key: _formState,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Container(
                                height: 140,
                                width: 140,
                                decoration: BoxDecoration(
                                  color: AppColors.greyColor.shade100,
                                  border: Border.all(
                                    color: AppColors.greyColor.shade600
                                  ),
                                  // borderRadius: BorderRadius.circular(10)
                                ),
                        //         child:_imageFile !=null 
                        //       ?Image.memory(Uint8List.fromList(_imageFile!.bytes!) ,fit:BoxFit.fill,)
                        // : Center(child: Text(
                        //   'Specialiy Image ',
                        //   style: TextStyle(
                        //     color: AppColors.greyColor.shade600,
                        //     fontSize: 18
                        //   )
                        // )), 
                        ),
                              SizedBox(height: 20,),
                               ElevatedButton(
                                onPressed: (){
                                
                                }, 
                              child: Text(' Upload Image'),
                        )
                            ],
                          ),
                        ),
                         Material(
                           child: Flexible(
                                child: SizedBox(
                                  width: 280,
                                  child: TextFormField(
                                    controller: specialtieName,
                                    onChanged: (value){
                                 
                                    },
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Please the specialty name must be not empty';
                                      }
                                      else{
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      labelText: '  Enter the specialty name',                                  
                                    )
                                  ),
                                ),
                              ),
                         ),                         
                        SizedBox(width: 30,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            elevation: 6
                          ),
                          onPressed: ()async{
                            await addspecialtie(context);
                           // uploadspecialty();
                          },
                           child: Text('Save'),),       
                      ],
                    ),
                  ),);
  }
}











// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ekram_project_dashboardadmin/models/appColors.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// class AddSpecilites extends StatefulWidget {
//   static const String routName ='\getAddSpecilitesWidget';

//   @override
//   State<AddSpecilites> createState() => _AddSpecilitesState();
// }


//  FirebaseStorage _storge =FirebaseStorage.instance;
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
 
//   late String specialtyName ;

//   dynamic _image;

// CollectionReference Specialties = FirebaseFirestore.instance.collection('Specialties');




// class _AddSpecilitesState extends State<AddSpecilites> {

//   pickImage()async{
//     FilePickerResult? result = await FilePicker.platform.
//     pickFiles(allowMultiple: false , type: FileType.image);

//     if(result!=null){
//       setState(() {
//         _image = result.files.first.bytes;
      
//       });
//     }
//   }

//     //upload speialty image to storge in firebase 
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
//     return    SingleChildScrollView(
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
//                   ),);
//   }
// }

