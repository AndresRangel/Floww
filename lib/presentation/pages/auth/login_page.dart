import 'package:floww/core/theme/theme_helper.dart';
import 'package:floww/presentation/pages/auth/register_page.dart';
import 'package:floww/presentation/widgets/languaje_currency_selector.dart';
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Contenido principal
            SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 60),
                  
                  // Logo y título
                  _buildHeader(context),
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
            
            // Botón de idioma/moneda
            Positioned(
              top: 10,
              right: 20,
              child: _buildLanguageButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageButton(BuildContext context) {
    // Mapeo de códigos de idioma a banderas
    final languageFlags = {
      'es': '🇲🇽',
      'en': '🇺🇸',
      'pt': '🇧🇷',
    };
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => showLanguageCurrencySelector(context),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.language,
                size: 20,
                color: AppColors.primaryBlue,
              ),
              const SizedBox(width: 6),
              Text(
                Get.locale?.languageCode.toUpperCase() ?? 'ES',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                languageFlags[Get.locale?.languageCode] ?? '🌍',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(context) {
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
        Text(
          'welcome_back'.tr,
          style:  TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'app_tagline'.tr,
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
            decoration: InputDecoration(
              labelText: 'email'.tr,
              hintText: 'tu@email.com',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'error_required_field'.tr;
              }
              if (!GetUtils.isEmail(value)) {
                return 'error_invalid_email'.tr;
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
              labelText: 'password'.tr,
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
                return 'error_required_field'.tr;
              }
              if (value.length < 6) {
                return 'error_password_short'.tr;
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
          : Text(
              'login'.tr,
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
      child: Text(
        'forgot_password'.tr,
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
          'no_account'.tr + ' ',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        TextButton(
          onPressed: () => Get.off(() =>  RegisterPage()),
          child: Text(
            'register'.tr,
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