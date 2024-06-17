class SpecilitesModels{
  late final  String specializationName;
  late final   String specializationImage;

  SpecilitesModels(
   this.specializationName,
   this.specializationImage, 
);

 Map<String, dynamic> toMap(){
    return  {
      'specializationName': specializationName,
      'specializationImage':specializationImage,
      
    };}

    //  factory SpecilitesModels.fromMap(Map<String, dynamic> json){

    // return SpecilitesModels(
    //   specializationName:json['specializationName'],
    //   specializationImage: json['specializationImage'],
     
    // );
    //  }

}


