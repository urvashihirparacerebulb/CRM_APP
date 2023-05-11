import 'package:crm_app/controllers/address_controller.dart';
import 'package:get/get.dart';
import '../controllers/account_controller.dart';
import '../controllers/authentication_controller.dart';
import '../controllers/contact_controller.dart';
import '../controllers/general_controller.dart';
import '../controllers/lead_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<GeneralController>(GeneralController(), permanent: true);
    Get.put<AuthenticationController>(AuthenticationController(), permanent: true);
    Get.put<AccountController>(AccountController(), permanent: true);
    Get.put<AddressController>(AddressController(), permanent: true);
    Get.put<ContactController>(ContactController(), permanent: true);
    Get.put<LeadController>(LeadController(), permanent: true);
  }
}
