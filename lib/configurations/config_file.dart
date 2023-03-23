class ApiConfig {

  static const String baseURL = "https://crm.cerebulb.com/api/";
  static const String loginURL = "${baseURL}ajax-login";
  static const String accOwnerURL = "${baseURL}user";
  static const String sectorURL = "${baseURL}sector";
  static const String subSectorURL = "${baseURL}sub-sector";
  static const String pinCodesURL = "${baseURL}search-pincode";
  static const String fetchCountryURL = "${baseURL}get-country";
  static const String fetchStateURL = "${baseURL}get-state";
  static const String fetchCityURL = "${baseURL}get-city";
  static const String addNewPinCodeURL = "${baseURL}add-new-pincode";
  static const String accountListURL = "${baseURL}get-company-list";
  static const String deleteAccountURL = "${baseURL}delete-company";

  static const String methodPOST = "post";
  static const String methodGET = "get";
  static const String methodPUT = "put";
  static const String methodDELETE = "delete";

  static const String error = "Error";
  static const String success = "Success";
  static const String warning = "Warning";

  static const String loginPref = "loginPref";
}
