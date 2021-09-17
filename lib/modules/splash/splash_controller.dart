import 'package:get/get.dart';

class SplashController extends GetxController {
  /**
  *  @override
  Future<void> onReady() async {
    super.onReady();
    await 4.seconds.delay();
    Get.offAllNamed('/login');
    
    //Future.delayed(
      Duration(seconds: 4),
      () => Get.offAllNamed('/login'),
    );
  }*/
}
