import 'package:crm_app/model/address_model.dart';

class ContactListResponseModel {
  ContactListResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  bool? status;
  String? message;
  List<ContactList>? data;

  factory ContactListResponseModel.fromJson(Map<String, dynamic> json) => ContactListResponseModel(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ContactList>.from(json["data"]!.map((x) => ContactList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ContactList {
  ContactList({
    this.accountName,
    this.adminName,
    this.id,
    this.designation,
    this.firstName,
    this.lastName,
    this.fullName,
    this.title,
    this.email,
    this.companyId,
    this.companyAddressId,
    this.department,
    this.mobileDialCode,
    this.mobileCountryCode,
    this.mobileNo,
    this.phoneDialCode,
    this.phoneCountryCode,
    this.phoneNo,
    this.extentionNo,
    this.extentionDialCode,
    this.extentionCountryCode,
    this.contactFax,
    this.description,
    this.reportingTo,
    this.personalNumberDialCode,
    this.personalNumberCountryCode,
    this.personalNumber,
    this.personalEmail,
    this.linkedinProfile,
    this.dob,
    this.profileImage,
    this.mailingStreet,
    this.mailingCity,
    this.mailingState,
    this.mailingCountry,
    this.mailingCode,
    this.cdate,
    this.mdate,
    this.userId,
    this.status,
    this.companyName
  });

  int? id;
  String? designation;
  String? firstName;
  String? lastName;
  String? fullName;
  String? accountName;
  String? adminName;
  String? title;
  String? email;
  int? companyId;
  int? companyAddressId;
  String? department;
  String? mobileDialCode;
  String? mobileCountryCode;
  String? mobileNo;
  String? phoneDialCode;
  String? phoneCountryCode;
  String? phoneNo;
  String? extentionNo;
  String? extentionDialCode;
  String? extentionCountryCode;
  String? contactFax;
  String? description;
  String? reportingTo;
  String? personalNumberDialCode;
  String? personalNumberCountryCode;
  String? personalNumber;
  String? personalEmail;
  String? linkedinProfile;
  String? dob;
  String? profileImage;
  String? mailingStreet;
  String? mailingCity;
  String? mailingState;
  String? mailingCountry;
  String? mailingCode;
  DateTime? cdate;
  DateTime? mdate;
  int? userId;
  int? status;
  String? companyName;

  factory ContactList.fromJson(Map<String, dynamic> json) => ContactList(
    accountName: json["account_name"],
    adminName: json["admin_name"],
    id: json["id"],
    designation: json["designation"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    fullName: json["full_name"],
    title: json["title"],
    email: json["email"],
    companyId: json["company_id"],
    companyAddressId: json["company_address_id"],
    department: json["department"],
    mobileDialCode: json["mobile_dial_code"],
    mobileCountryCode: json["mobile_country_code"],
    mobileNo: json["mobile_no"],
    phoneDialCode: json["phone_dial_code"],
    phoneCountryCode: json["phone_country_code"],
    phoneNo: json["phone_no"],
    extentionNo: json["extention_no"],
    extentionDialCode: json["extention_dial_code"],
    extentionCountryCode: json["extention_country_code"],
    contactFax: json["contact_fax"],
    description: json["description"],
    reportingTo: json["reporting_to"],
    personalNumberDialCode: json["personal_number_dial_code"],
    personalNumberCountryCode: json["personal_number_country_code"],
    personalNumber: json["personal_number"],
    personalEmail: json["personal_email"],
    linkedinProfile: json["linkedin_profile"],
    dob: json["dob"],
    profileImage: json["profile_image"],
    mailingStreet: json["mailing_street"],
    mailingCity: json["mailing_city"],
    mailingState: json["mailing_state"],
    mailingCountry: json["mailing_country"],
    mailingCode: json["mailing_code"],
    cdate: json["cdate"] == null ? null : DateTime.parse(json["cdate"]),
    mdate: json["mdate"] == null ? null : DateTime.parse(json["mdate"]),
    userId: json["user_id"],
    status: json["status"],
    companyName: json["company_name"],
  );

  Map<String, dynamic> toJson() => {
    "account_name": accountName,
    "admin_name": adminName,
    "id": id,
    "designation": designation,
    "first_name": firstName,
    "last_name": lastName,
    "full_name": fullName,
    "title": title,
    "email": email,
    "company_id": companyId,
    "company_address_id": companyAddressId,
    "department": department,
    "mobile_dial_code": mobileDialCode,
    "mobile_country_code": mobileCountryCode,
    "mobile_no": mobileNo,
    "phone_dial_code": phoneDialCode,
    "phone_country_code": phoneCountryCode,
    "phone_no": phoneNo,
    "extention_no": extentionNo,
    "extention_dial_code": extentionDialCode,
    "extention_country_code": extentionCountryCode,
    "contact_fax": contactFax,
    "description": description,
    "reporting_to": reportingTo,
    "personal_number_dial_code": personalNumberDialCode,
    "personal_number_country_code": personalNumberCountryCode,
    "personal_number": personalNumber,
    "personal_email": personalEmail,
    "linkedin_profile": linkedinProfile,
    "dob": dob,
    "profile_image": profileImage,
    "mailing_street": mailingStreet,
    "mailing_city": mailingCity,
    "mailing_state": mailingState,
    "mailing_country": mailingCountry,
    "mailing_code": mailingCode,
    "cdate": cdate?.toIso8601String(),
    "mdate": mdate?.toIso8601String(),
    "user_id": userId,
    "status": status,
    "company_name": companyName,
  };
}

class ContactDetailResponseModel {
  int? statusCode;
  bool? status;
  String? message;
  ContactDetail? data;

  ContactDetailResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  factory ContactDetailResponseModel.fromJson(Map<String, dynamic> json) => ContactDetailResponseModel(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : ContactDetail.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class ContactDetail {
  ContactList? contactData;
  List<AddressResponse>? addressData;

  ContactDetail({
    this.contactData,
    this.addressData,
  });

  factory ContactDetail.fromJson(Map<String, dynamic> json) => ContactDetail(
    contactData: json["contact-data"] == null ? null : ContactList.fromJson(json["contact-data"]),
    addressData: json["address-data"] == null ? [] : List<AddressResponse>.from(json["address-data"]!.map((x) => AddressResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "contact-data": contactData?.toJson(),
    "address-data": addressData == null ? [] : List<dynamic>.from(addressData!.map((x) => x.toJson())),
  };
}

