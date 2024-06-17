import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekram_project_dashboardadmin/models/appColors.dart';
import 'package:ekram_project_dashboardadmin/sideBarScreen/widget/advertisementsWidget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class advertisementManagementScreen extends StatefulWidget {
 static const String routName ='\advertisementManagementScreen';

  @override
  State<advertisementManagementScreen> createState() => _advertisementManagementScreenState();
}

class _advertisementManagementScreenState extends State<advertisementManagementScreen> {
  
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  dynamic _image;
 

  pickImage()async{
    FilePickerResult? result = await FilePicker.platform.
    pickFiles(allowMultiple: false , type: FileType.image);

    if(result!=null){
      setState(() {
        _image = result.files.first.bytes;
        
      });
    }

  }

  _uploadadvertisementToStorge(dynamic image)async{
    Reference ref =_storage.ref().child('Banners');

    UploadTask uploadTask = ref.putData(image);

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl =await snapshot.ref.getDownloadURL();
      return downloadUrl;
  }

  __uploadadvertisementToFireStore()async{
    
    if(_image!=null){
      EasyLoading.show();
      String imageUrl =await _uploadadvertisementToStorge(_image);


      await _firestore.collection('Banners').doc().set({
        'image' : imageUrl,
      }).whenComplete(() {
        EasyLoading.dismiss();
        setState(() {
          _image = null;
        });
      })
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10),
                child: Text('Advertising Management ',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 36
                ),
                ),
              ),
             
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: AppColors.greyColor.shade100,
            ),
          ),
          Row(
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
                        //borderRadius: BorderRadius.circular(10)
                      ),
                      child:_image!=null 
                      ? Image.memory(_image, fit: BoxFit.cover,) 
                      : Center(child: Text('Advertisements ')),
                    ),
                    SizedBox(height: 20,),
                     ElevatedButton(
                      onPressed: (){
                        pickImage();
                      }, 
                    child: Text(' Upload Image')
              )
                  ],
                ),
              ),

              SizedBox(width: 30,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 6
                ),
                onPressed: (){
                  __uploadadvertisementToFireStore();
                },
                 child: Text('Save'),)
            ],
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Divider(
              color: AppColors.greyColor.shade100,
                       ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
              alignment: Alignment.topLeft,
              child: Text('Advertisements',
              style: TextStyle(
                fontSize: 36, 
                fontWeight: FontWeight.bold
              ),
              ),
             ),
           ),
           AdvertisementsWidget(),
        ],
      ),
    );
  }
}