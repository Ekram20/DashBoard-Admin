class ReqestsModels{
  final String clinicName;
  final String CertificateNumber;
  final dynamic licenseImage;
  final String phoneNumber;
  final bool status;
  final  bool isSee;

  ReqestsModels({
    required this.CertificateNumber,
    required this.clinicName,
    required this.licenseImage,
    required this.phoneNumber,
    required this.status,
    required this.isSee,
  });

  Map<String, dynamic> toMap(){
    return  {
      'status': status,
      'CertificateNumber':CertificateNumber,
      'clinicName':clinicName,
      'licenseImage':licenseImage,
      'phoneNumber':phoneNumber,
      'isSee':isSee
    };}

    factory ReqestsModels.fromMap(Map<String, dynamic> json){
    return ReqestsModels(
      isSee:json['isSee'],
      status: json['state'],
      CertificateNumber: json['CertificateNumber'],
      clinicName: json['clinicName'],
      licenseImage: json['licenseImage'],
      phoneNumber: json['phoneNumber']
    );
  }

}
