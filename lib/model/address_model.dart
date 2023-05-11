
class CountryStateResponseModel {
  CountryStateResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  bool? status;
  String? message;
  List<CountryState>? data;

  factory CountryStateResponseModel.fromJson(Map<String, dynamic> json) => CountryStateResponseModel(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: List<CountryState>.from(json["data"].map((x) => CountryState.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}


class CountryState {
  CountryState({
    this.id,
    this.pinCode,
    this.name,
    this.cityId,
    this.cityName,
    this.stateName,
    this.countryName,
    this.countryId,
    this.stateId,
    this.manageUserId,
  });

  num? id;
  String? pinCode;
  String? name;
  String? cityName;
  String? stateName;
  String? countryName;
  num? cityId;
  num? stateId;
  num? countryId;
  num? manageUserId;

  factory CountryState.fromJson(Map<String, dynamic> json) => CountryState(
    id: json["id"],
    countryId: json["country_id"],
    name: json["name"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    cityName: json["city_name"],
    stateName: json["state_name"],
    countryName: json["country_name"],
    pinCode: json["pincode"],
    manageUserId: json["manage_user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country_id": countryId,
    "name": name,
    "state_id": stateId,
    "city_id": cityId,
    "city_name": cityName,
    "state_name": stateName,
    "country_name": countryName,
    "pincode": pinCode,
    "manage_user_id": manageUserId
  };
}

class AddressListResponse {
  int? statusCode;
  bool? status;
  String? message;
  List<AddressResponse>? data;

  AddressListResponse({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  factory AddressListResponse.fromJson(Map<String, dynamic> json) => AddressListResponse(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<AddressResponse>.from(json["data"]!.map((x) => AddressResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AddressResponse {
  int? id;
  int? companyId;
  String? addressType;
  String? accountSite;
  String? address;
  String? city;
  String? state;
  String? country;
  String? pincodeNo;
  int? pincodeId;
  int? cityId;
  int? stateId;
  int? countryId;

  AddressResponse({
    this.id,
    this.companyId,
    this.addressType,
    this.accountSite,
    this.address,
    this.city,
    this.state,
    this.country,
    this.pincodeNo,
    this.pincodeId,
    this.cityId,
    this.stateId,
    this.countryId,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) => AddressResponse(
    id: json["id"],
    companyId: json["company_id"],
    addressType: json["address_type"],
    accountSite: json["account_site"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    pincodeNo: json["pincode_no"],
    pincodeId: json["pincode_id"],
    cityId: json["city_id"],
    stateId: json["state_id"],
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
    "pincode_no": pincodeNo,
    "pincode_id": pincodeId,
    "city_id": cityId,
    "state_id": stateId,
    "country_id": countryId,
  };
}
