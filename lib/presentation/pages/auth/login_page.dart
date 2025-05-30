import 'package:floww/presentation/pages/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              
              // Logo y título
              _buildHeader(),
              const SizedBox(height: 60),
              
              // Formulario
              _buildForm(controller),
              const SizedBox(height: 24),
              
              // Botón de login
              _buildLoginButton(controller),
              const SizedBox(height: 16),
              
              // Olvidé mi contraseña
              _buildForgotPassword(),
              const SizedBox(height: 32),
              
              // Divider con "O"
              _buildDivider(),
              const SizedBox(height: 32),
              
              // Botones sociales (preparados para el futuro)
              _buildSocialButtons(),
              const SizedBox(height: 32),
              
              // Link a registro
              _buildRegisterLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primaryBlue, AppColors.lightBlue],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text(
              'Fw',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: -2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Bienvenido de vuelta',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Fluye con tu dinero',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildForm(LoginController controller) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          // Email field
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
          
          // Password field
          Obx(() => TextFormField(
            controller: controller.passwordController,
            obscureText: controller.obscurePassword.value,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => controller.login(),
            decoration: InputDecoration(
              labelText: 'Contraseña',
              hintText: '••••••••',
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
                return 'Por favor ingresa tu contraseña';
              }
              if (value.length < 6) {
                return 'La contraseña debe tener al menos 6 caracteres';
              }
              return null;
            },
          )),
        ],
      ),
    );
  }

  Widget _buildLoginButton(LoginController controller) {
    return Obx(() => ElevatedButton(
      onPressed: controller.isLoading.value ? null : controller.login,
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
              'Iniciar Sesión',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
    ));
  }

  Widget _buildForgotPassword() {
    return TextButton(
      onPressed: () {
        // TODO: Implementar recuperación de contraseña
        Get.snackbar(
          'Próximamente',
          'La recuperación de contraseña estará disponible pronto',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      child: const Text(
        '¿Olvidaste tu contraseña?',
        style: TextStyle(color: AppColors.textSecondary),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'O',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      children: [
        // Botón de Google (preparado para el futuro)
        OutlinedButton.icon(
          onPressed: () {
            Get.snackbar(
              'Próximamente',
              'Login con Google estará disponible pronto',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          icon: const Icon(Icons.g_mobiledata, size: 24),
          label: const Text('Continuar con Google'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            side: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta? ',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        TextButton(
          onPressed: () => Get.off(() =>  RegisterPage()),
          child: const Text(
            'Regístrate',
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