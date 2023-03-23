import 'login_response_model.dart';

class AccountOwnerResponseModel {
  AccountOwnerResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  bool? status;
  String? message;
  List<UserLoginData>? data;

  factory AccountOwnerResponseModel.fromJson(Map<String, dynamic> json) => AccountOwnerResponseModel(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: List<UserLoginData>.from(json["data"].map((x) => UserLoginData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}


class SectorResponseModel {
  SectorResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  bool? status;
  String? message;
  List<Sector>? data;

  factory SectorResponseModel.fromJson(Map<String, dynamic> json) => SectorResponseModel(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: List<Sector>.from(json["data"].map((x) => Sector.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Sector {
  Sector({
    this.id,
    this.name,
    this.userId,
    this.status,
  });

  int? id;
  String? name;
  int? userId;
  int? status;

  factory Sector.fromJson(Map<String, dynamic> json) => Sector(
    id: json["id"],
    name: json["name"],
    userId: json["user_id"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "user_id": userId,
    "status": status,
  };
}


class AccountListResponseModel {
  AccountListResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  bool? status;
  String? message;
  List<AccountList>? data;

  factory AccountListResponseModel.fromJson(Map<String, dynamic> json) => AccountListResponseModel(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: List<AccountList>.from(json["data"].map((x) => AccountList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AccountList {
  AccountList({
    this.id,
    this.name,
    this.sector,
    this.accountType,
    this.website,
    this.adminName,
    this.phone,
    this.email,
    this.logo,
    this.status,
    this.cdate,
  });

  int? id;
  String? name;
  String? sector;
  String? accountType;
  String? website;
  String? adminName;
  String? phone;
  String? email;
  String? logo;
  int? status;
  String? cdate;

  factory AccountList.fromJson(Map<String, dynamic> json) => AccountList(
    id: json["id"],
    name: json["name"],
    sector: json["sector"],
    accountType: json["account_type"],
    website: json["website"],
    adminName: json["admin_name"],
    phone: json["phone"],
    email: json["email"],
    logo: json["logo"],
    status: json["status"],
    cdate: json["cdate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sector": sector,
    "account_type": accountType,
    "website": website,
    "admin_name": adminName,
    "phone": phone,
    "email": email,
    "logo": logo,
    "status": status,
    "cdate": cdate,
  };
}