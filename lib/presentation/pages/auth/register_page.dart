import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import 'register_controller.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
   final controller = Get.put(RegisterController());
   RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              _buildHeader(),
              const SizedBox(height: 40),
              
              // Formulario
              _buildForm(controller),
              const SizedBox(height: 24),
              
              // Botón de registro
              _buildRegisterButton(controller),
              const SizedBox(height: 16),
              
              // Términos y condiciones
              _buildTerms(),
              const SizedBox(height: 32),
              
              // Link a login
              _buildLoginLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Crear cuenta',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Comienza a fluir con tu dinero',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildForm(RegisterController controller) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          // Nombre
          TextFormField(
            controller: controller.nameController,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Nombre completo',
              hintText: 'Juan Pérez',
              prefixIcon: Icon(Icons.person_outline),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu nombre';
              }
              if (value.length < 3) {
                return 'El nombre debe tener al menos 3 caracteres';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          
          // Email
          TextFormField(
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Correo electrónico',
              hintText: 'tu@email.com',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu correo';
              }
              if (!GetUtils.isEmail(value)) {
                return 'Ingresa un correo válido';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          
          // Contraseña
          Obx(() => TextFormField(
            controller: controller.passwordController,
            obscureText: controller.obscurePassword.value,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              hintText: 'Mínimo 6 caracteres',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  controller.obscurePassword.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: controller.togglePasswordVisibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa una contraseña';
              }
              if (value.length < 6) {
                return 'La contraseña debe tener al menos 6 caracteres';
              }
              return null;
            },
          )),
          const SizedBox(height: 16),
          
          // Confirmar contraseña
          Obx(() => TextFormField(
            controller: controller.confirmPasswordController,
            obscureText: controller.obscureConfirmPassword.value,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => controller.register(),
            decoration: InputDecoration(
              labelText: 'Confirmar contraseña',
              hintText: 'Repite tu contraseña',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  controller.obscureConfirmPassword.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: controller.toggleConfirmPasswordVisibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor confirma tu contraseña';
              }
              if (value != controller.passwordController.text) {
                return 'Las contraseñas no coinciden';
              }
              return null;
            },
          )),
        ],
      ),
    );
  }

  Widget _buildRegisterButton(RegisterController controller) {
    return Obx(() => ElevatedButton(
      onPressed: controller.isLoading.value ? null : controller.register,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: controller.isLoading.value
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : const Text(
              'Crear cuenta',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
    ));
  }

  Widget _buildTerms() {
    return Obx(() => Row(
      children: [
        Checkbox(
          value: controller.acceptTerms.value,
          onChanged: (value) => controller.acceptTerms.value = value ?? false,
          activeColor: AppColors.primaryBlue,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'Acepto los ',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
              children: [
                TextSpan(
                  text: 'términos y condiciones',
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' y la ',
                ),
                TextSpan(
                  text: 'política de privacidad',
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿Ya tienes cuenta? ',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        TextButton(
          onPressed: () => Get.off(() => const LoginPage()),
          child: const Text(
            'Inicia sesión',
            style: TextStyle(
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}