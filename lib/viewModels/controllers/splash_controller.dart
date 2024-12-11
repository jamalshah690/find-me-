import 'package:findme/views/dashBoardView/home.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    navigateUser();
  }

  navigateUser() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() =>   HomeView());
    });
  }
}
