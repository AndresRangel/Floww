import 'package:get/get.dart';
import '../auth/login_page.dart';

class SplashController extends GetxController {
  final RxString loadingText = 'loading'.tr.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      // Simular proceso de carga
      await Future.delayed(const Duration(seconds: 1));
      loadingText.value = 'loading'.tr;
      
      await Future.delayed(const Duration(seconds: 1));
      loadingText.value = 'loading'.tr;
      
      await Future.delayed(const Duration(seconds: 1));
      
      // Navegar a la página de login
      Get.off(() => const LoginPage());
      
    } catch (e) {
      Get.snackbar(
        'Error',
        'No se pudo inicializar la app: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
    }
  }
}