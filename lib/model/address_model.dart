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
    this.manageUserId
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
