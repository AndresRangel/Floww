import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final RxBool isLoading = false.obs;
  final RxBool obscurePassword = true.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true;
      
      // TODO: Aquí irá la lógica real de login con Firebase
      // Por ahora simulamos un login
      await Future.delayed(const Duration(seconds: 2));
      
      // Simulamos éxito
      Get.snackbar(
        '¡Bienvenido!',
        'Has iniciado sesión correctamente',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.primary,
        colorText: Colors.white,
      );
      
      // TODO: Navegar al home
      // Get.off(() => const HomePage());
      
    } catch (e) {
      Get.snackbar(
        'Error',
        'No se pudo iniciar sesión: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}