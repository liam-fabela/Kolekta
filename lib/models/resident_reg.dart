class ResidentReg {
  String residentId;
  String userType;
  String residentLname;
  String residentFname;
  String residentAddress;
  String residentEmail;
  String residentMobile;
  String residentPassword;

  ResidentReg({
    required this.residentId,
    required this.userType,
    required this.residentLname,
    required this.residentFname,
    required this.residentAddress,
    required this.residentEmail,
    required this.residentMobile,
    required this.residentPassword
  });

   factory ResidentReg.fromJson(Map<String, dynamic> json) {
    return ResidentReg(
      residentId: json['resident_id'] as String,
      userType: json['userType'] as String,
      residentLname: json['res_lname'] as String,
      residentFname: json['res_fname'] as String,
      residentAddress: json['res_address'] as String,
      residentEmail: json['res_email'] as String,
      residentMobile: json['res_mobile'] as String,
      residentPassword: json['res_password'] as String
    );
  }
}