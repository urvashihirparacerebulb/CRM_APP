class LeadListResponseModel {
  int? statusCode;
  bool? status;
  String? message;
  List<Lead>? data;

  LeadListResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  factory LeadListResponseModel.fromJson(Map<String, dynamic> json) => LeadListResponseModel(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Lead>.from(json["data"]!.map((x) => Lead.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Lead {
  String? leadName;
  String? accountName;
  String? leadSector;
  String? website;
  String? stageName;
  String? adminName;
  int? leadId;
  String? firstName;
  String? lastName;
  int? leadCompany;
  String? email;
  String? mobileNo;
  String? phoneNo;
  String? fax;
  String? description;
  int? status;
  DateTime? createdAt;
  int? leadStage;
  String? leadStageName;
  String? leadCompanyName;

  Lead({
    this.leadName,
    this.accountName,
    this.leadSector,
    this.website,
    this.stageName,
    this.adminName,
    this.leadId,
    this.firstName,
    this.lastName,
    this.leadCompany,
    this.email,
    this.mobileNo,
    this.phoneNo,
    this.fax,
    this.description,
    this.status,
    this.createdAt,
    this.leadStage,
    this.leadStageName,
    this.leadCompanyName,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => Lead(
    leadName: json["lead_name"],
    accountName: json["account_name"],
    leadSector: json["lead_sector"],
    website: json["website"],
    stageName: json["stage_name"],
    adminName: json["admin_name"],
    leadId: json["lead_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    leadCompany: json["lead_company"],
    email: json["email"],
    mobileNo: json["mobile_no"],
    phoneNo: json["phone_no"],
    fax: json["fax"],
    description: json["description"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    leadStage: json["lead_stage"],
    leadStageName: json["lead_stage_name"],
    leadCompanyName: json["lead_company_name"],
  );

  Map<String, dynamic> toJson() => {
    "lead_name": leadName,
    "account_name": accountName,
    "lead_sector": leadSector,
    "website": website,
    "stage_name": stageName,
    "admin_name": adminName,
    "lead_id": leadId,
    "first_name": firstName,
    "last_name": lastName,
    "lead_company": leadCompany,
    "email": email,
    "mobile_no": mobileNo,
    "phone_no": phoneNo,
    "fax": fax,
    "description": description,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "lead_stage": leadStage,
    "lead_stage_name": leadStageName,
    "lead_company_name": leadCompanyName,
  };
}