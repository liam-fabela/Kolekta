class CollectorReg {
  String collectorId;
  String userType;
  String collectorLname;
  String collectorFname;
  String collectorAddress;
  String collectorEmail;
  String collectorMobile;
  String collectorPassword;

  CollectorReg({
    required this.collectorId,
    required this.userType,
    required this.collectorLname,
    required this.collectorFname,
    required this.collectorAddress,
    required this.collectorEmail,
    required this.collectorMobile,
    required this.collectorPassword
  });

   factory CollectorReg.fromJson(Map<String, dynamic> json) {
    return CollectorReg(
      collectorId: json['collector_id'] as String,
      userType: json['userType'] as String,
      collectorLname: json['coll_lname'] as String,
      collectorFname: json['coll_fname'] as String,
      collectorAddress: json['coll_address'] as String,
      collectorEmail: json['coll_email'] as String,
      collectorMobile: json['coll_mobile'] as String,
      collectorPassword: json['coll_password'] as String
    );
  }
}