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

class CompanyListResponse {
  CompanyListResponse({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  bool? status;
  String? message;
  List<AccountList>? data;

  factory CompanyListResponse.fromJson(Map<String, dynamic> json) => CompanyListResponse(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<AccountList>.from(json["data"]!.map((x) => AccountList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
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
  AccountListResponse? data;

  factory AccountListResponseModel.fromJson(Map<String, dynamic> json) => AccountListResponseModel(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : AccountListResponse.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class AccountListResponse {
  AccountListResponse({
    this.data,
    this.addresses,
  });

  AccountList? data;
  List<Address>? addresses;

  factory AccountListResponse.fromJson(Map<String, dynamic> json) => AccountListResponse(
    data: json["company_data"] == null ? null : AccountList.fromJson(json["company_data"]),
    addresses: json["addresses"] == null ? [] : List<Address>.from(json["addresses"]!.map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "company_data": data?.toJson(),
    "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x.toJson())),
  };
}

class AccountList {
  AccountList({
    this.id,
    this.accountOwner,
    this.fax,
    this.parentAccount,
    this.ownership,
    this.accountType,
    this.sector,
    this.subSector,
    this.addressType,
    this.name,
    this.adminName,
    this.address,
    this.pincodeId,
    this.cityId,
    this.stateId,
    this.countryId,
    this.mobile,
    this.mobileDialCode,
    this.mobileCountryCode,
    this.phone,
    this.phoneDialCode,
    this.phoneCountryCode,
    this.extention,
    this.extentionDialCode,
    this.extentionCountryCode,
    this.email,
    this.accountSite,
    this.website,
    this.description,
    this.logo,
    this.cdate,
    this.mdate,
    this.userId,
    this.status,
    this.sectorName,
    this.subsectorName,
    this.accountOwnerName,
  });

  int? id;
  int? accountOwner;
  String? fax;
  String? parentAccount;
  String? ownership;
  String? accountType;
  String? sector;
  int? subSector;
  String? addressType;
  String? name;
  String? adminName;
  String? address;
  String? pincodeId;
  String? cityId;
  String? stateId;
  String? countryId;
  String? mobile;
  String? mobileDialCode;
  String? mobileCountryCode;
  String? phone;
  String? phoneDialCode;
  String? phoneCountryCode;
  String? extention;
  String? extentionDialCode;
  String? extentionCountryCode;
  String? email;
  String? accountSite;
  String? website;
  String? description;
  String? logo;
  String? cdate;
  String? mdate;
  int? userId;
  int? status;
  String? sectorName;
  String? subsectorName;
  String? accountOwnerName;

  factory AccountList.fromJson(Map<String, dynamic> json) => AccountList(
    id: json["id"],
    accountOwner: json["account_owner"],
    fax: json["fax"],
    parentAccount: json["parent_account"],
    ownership: json["ownership"],
    accountType: json["account_type"],
    sector: json["sector"],
    subSector: json["sub_sector"],
    addressType: json["address_type"],
    name: json["name"],
    adminName: json["admin_name"],
    address: json["address"],
    pincodeId: json["pincode_id"],
    cityId: json["city_id"],
    stateId: json["state_id"],
    countryId: json["country_id"],
    mobile: json["mobile"],
    mobileDialCode: json["mobile_dial_code"],
    mobileCountryCode: json["mobile_country_code"],
    phone: json["phone"],
    phoneDialCode: json["phone_dial_code"],
    phoneCountryCode: json["phone_country_code"],
    extention: json["extention"],
    extentionDialCode: json["extention_dial_code"],
    extentionCountryCode: json["extention_country_code"],
    email: json["email"],
    accountSite: json["account_site"],
    website: json["website"],
    description: json["description"],
    logo: json["logo"],
    cdate: json["cdate"],
    mdate: json["mdate"],
    userId: json["user_id"],
    status: json["status"],
    sectorName: json["sector_name"],
    subsectorName: json["subsector_name"],
    accountOwnerName: json["account_owner_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "account_owner": accountOwner,
    "fax": fax,
    "parent_account": parentAccount,
    "ownership": ownership,
    "account_type": accountType,
    "sector": sector,
    "sub_sector": subSector,
    "address_type": addressType,
    "name": name,
    "admin_name": adminName,
    "address": address,
    "pincode_id": pincodeId,
    "city_id": cityId,
    "state_id": stateId,
    "country_id": countryId,
    "mobile": mobile,
    "mobile_dial_code": mobileDialCode,
    "mobile_country_code": mobileCountryCode,
    "phone": phone,
    "phone_dial_code": phoneDialCode,
    "phone_country_code": phoneCountryCode,
    "extention": extention,
    "extention_dial_code": extentionDialCode,
    "extention_country_code": extentionCountryCode,
    "email": email,
    "account_site": accountSite,
    "website": website,
    "description": description,
    "logo": logo,
    "cdate": cdate,
    "mdate": mdate,
    "user_id": userId,
    "status": status,
    "sector_name": sectorName,
    "subsector_name": subsectorName,
    "account_owner_name": accountOwnerName,
  };
}


class Address {
  Address({
    this.id,
    this.companyId,
    this.addressType,
    this.accountSite,
    this.address,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.email,
    this.phone,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.pincodeValue,
    this.stateId,
    this.cityId,this.countryId
  });

  int? id;
  int? companyId;
  String? addressType;
  String? accountSite;
  String? address;
  String? city;
  String? state;
  String? country;
  int? pincode;
  String? email;
  String? phone;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? pincodeValue;
  num? cityId;
  num? stateId;
  num? countryId;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    companyId: json["company_id"],
    addressType: json["address_type"],
    accountSite: json["account_site"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    pincode: json["pincode"],
    email: json["email"],
    phone: json["phone"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    pincodeValue: json["pincode_value"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    countryId: json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
    "address_type": addressType,
    "account_site": accountSite,
    "address": address,
    "city": city,
    "state": state,
    "country": country,
    "pincode": pincode,
    "email": email,
    "phone": phone,
    "status": status,
    "created_at": createdAt,
    "pincode_value": pincodeValue,
    "updated_at": updatedAt,
    "state_id": stateId,
    "city_id": cityId,
    "country_id": countryId,
  };
}