import 'package:app_filmes/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    /**
     * ter o comtrolle da pagina
     */
    Get.put(SplashController());
  }
}
