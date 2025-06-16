class ProfileList {
  String? lastName;
  String? empId;
  String? profileImageId;
  String? paymentEnable;
  String? profileImage;
  String? emailUniqId;
  String? otpEnabled;
  String? firstName;
  bool? soOrderInfo;
  String? profileId;
  String? contactNumUniqId;
  bool? stateHead;
  String? contactNumber;
  String? email;
  String? otpDuration;

  ProfileList(
      {this.lastName,
      this.empId,
      this.profileImageId,
      this.paymentEnable,
      this.profileImage,
      this.emailUniqId,
      this.otpEnabled,
      this.firstName,
      this.soOrderInfo,
      this.profileId,
      this.contactNumUniqId,
      this.stateHead,
      this.contactNumber,
      this.email,
      this.otpDuration});

  ProfileList.fromJson(Map<String, dynamic> json) {
    lastName = json['lastName'];
    empId = json['empId'];
    profileImageId = json['profileImageId'];
    paymentEnable = json['paymentEnable'];
    profileImage = json['profileImage'];
    emailUniqId = json['emailUniqId'];
    otpEnabled = json['otpEnabled'];
    firstName = json['firstName'];
    soOrderInfo = json['SoOrderInfo'];
    profileId = json['profileId'];
    contactNumUniqId = json['contactNumUniqId'];
    stateHead = json['stateHead'];
    contactNumber = json['contactNumber'];
    email = json['email'];
    otpDuration = json['otpDuration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lastName'] = lastName;
    data['empId'] = empId;
    data['profileImageId'] = profileImageId;
    data['paymentEnable'] = paymentEnable;
    data['profileImage'] = profileImage;
    data['emailUniqId'] = emailUniqId;
    data['otpEnabled'] = otpEnabled;
    data['firstName'] = firstName;
    data['SoOrderInfo'] = soOrderInfo;
    data['profileId'] = profileId;
    data['contactNumUniqId'] = contactNumUniqId;
    data['stateHead'] = stateHead;
    data['contactNumber'] = contactNumber;
    data['email'] = email;
    data['otpDuration'] = otpDuration;
    return data;
  }
}
