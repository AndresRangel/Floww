import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../mode_selection/mode_selection_page.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  final RxBool isLoading = false.obs;
  final RxBool obscurePassword = true.obs;
  final RxBool obscureConfirmPassword = true.obs;
  final RxBool acceptTerms = false.obs;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;
    
    if (!acceptTerms.value) {
      Get.snackbar(
        'Términos y condiciones',
        'Debes aceptar los términos y condiciones para continuar',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;
      
      // TODO: Aquí irá la lógica real de registro con Firebase
      // Por ahora simulamos un registro
      await Future.delayed(const Duration(seconds: 2));
      
      // Simulamos éxito
      Get.snackbar(
        '¡Cuenta creada!',
        'Tu cuenta ha sido creada exitosamente',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.primary,
        colorText: Colors.white,
      );
      
      // Navegar a la selección de modo
      Get.off(() => const ModeSelectionPage());
      
    } catch (e) {
      Get.snackbar(
        'Error',
        'No se pudo crear la cuenta: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}