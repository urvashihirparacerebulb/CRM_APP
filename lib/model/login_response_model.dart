class LoginResponseModel {
  LoginResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  bool? status;
  String? message;
  LoginResponse? data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: LoginResponse.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class LoginResponse {
  LoginResponse({
    this.userlogindata,
  });

  UserLoginData? userlogindata;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    userlogindata: UserLoginData.fromJson(json["userlogindata"]),
  );

  Map<String, dynamic> toJson() => {
    "userlogindata": userlogindata?.toJson(),
  };
}

class UserLoginData {
  UserLoginData({
    this.username,
    this.randomId,
    this.name,
    this.id,
    this.groupId,
    this.title,
    this.loggedIn,
  });

  String? username;
  String? randomId;
  String? name;
  int? id;
  int? groupId;
  String? title;
  int? loggedIn;

  factory UserLoginData.fromJson(Map<String, dynamic> json) => UserLoginData(
    username: json["username"],
    randomId: json["random_ID"],
    name: json["name"],
    id: json["id"],
    groupId: json["group_id"],
    title: json["title"],
    loggedIn: json["logged_in"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "random_ID": randomId,
    "name": name,
    "id": id,
    "group_id": groupId,
    "title": title,
    "logged_in": loggedIn,
  };
}
