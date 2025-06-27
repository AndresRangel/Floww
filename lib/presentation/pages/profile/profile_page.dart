import 'dart:io';
import 'package:floww/core/services/currency_service.dart';
import 'package:floww/core/theme/theme_helper.dart';
import 'package:floww/presentation/widgets/languaje_currency_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';

import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('profile'.tr),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).textTheme.bodyLarge!.color,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header con foto
            _buildPhotoHeader(controller,context),
            
            const SizedBox(height: 20),
            
            // Secciones de configuración
            _buildSection(
              title: 'Información Personal',
              children: [
                _buildInfoTile(
                  icon: Icons.person_outline,
                  title: 'Nombre',
                  subtitle: controller.userName.value,
                  onTap: () {
                    // TODO: Implementar edición de nombre
                    Get.snackbar(
                      'Próximamente',
                      'Edición de nombre estará disponible pronto',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                ),
                _buildInfoTile(
                  icon: Icons.email_outlined,
                  title: 'Email',
                  subtitle: controller.userEmail.value,
                  onTap: null, // Email no editable por ahora
                ),
              ],
              context: context
            ),
            
            _buildSection(
              title: 'Configuración',
              children: [
                _buildSettingTile(
                  icon: Icons.language,
                  title: 'language'.tr,
                  subtitle: _getCurrentLanguage(),
                  onTap: () => showLanguageCurrencySelector(context),
                ),
                _buildSettingTile(
                  icon: Icons.attach_money,
                  title: 'currency'.tr,
                  subtitle: _getCurrentCurrency(),
                  onTap: () => showLanguageCurrencySelector(context),
                ),
                Obx(() => SwitchListTile(
                  secondary: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      controller.isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  title: Text('theme'.tr),
                  subtitle: Text(
                    controller.isDarkMode.value ? 'dark_mode'.tr : 'light_mode'.tr,
                  ),
                  value: controller.isDarkMode.value,
                  onChanged: (_) => controller.toggleTheme(),
                )),
              ],
              context: context
            ),
            
            _buildSection(
              title: 'Seguridad',
              children: [
                _buildSettingTile(
                  icon: Icons.lock_outline,
                  title: 'Cambiar Contraseña',
                  onTap: controller.changePassword,
                ),
              ],
              context: context
            ),
            
            // Botón de cerrar sesión
            Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              child: Obx(() => ElevatedButton(
                onPressed: controller.isLoading.value ? null : controller.logout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
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
                        'Cerrar Sesión',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              )),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoHeader(ProfileController controller,context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Obx(() => Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryBlue, AppColors.lightBlue],
                  ),
                  image: controller.userPhotoPath.value.isNotEmpty
                      ? DecorationImage(
                          image: FileImage(File(controller.userPhotoPath.value)),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: controller.userPhotoPath.value.isEmpty
                    ? Center(
                        child: Text(
                          controller.userName.value.isNotEmpty
                              ? controller.userName.value[0].toUpperCase()
                              : 'U',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : null,
              )),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Obx(() => IconButton(
                    icon: controller.isUploadingPhoto.value
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Icon(
                            Icons.camera_alt,
                            size: 18,
                            color: Colors.white,
                          ),
                    onPressed: controller.isUploadingPhoto.value
                        ? null
                        : controller.showPhotoOptions,
                    padding: EdgeInsets.zero,
                  )),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() => Text(
            controller.userName.value,
            style:  TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          )),
          const SizedBox(height: 4),
          Obx(() => Text(
            controller.userEmail.value,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required List<Widget> children,required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Container(
            color: Theme.of(context).cardColor,
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primaryBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.primaryBlue),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: onTap != null ? const Icon(Icons.chevron_right) : null,
      onTap: onTap,
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primaryBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.primaryBlue),
      ),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  String _getCurrentLanguage() {
    final locale = Get.locale;
    switch (locale?.languageCode) {
      case 'es':
        return 'Español 🇲🇽';
      case 'en':
        return 'English 🇺🇸';
      case 'pt':
        return 'Português 🇧🇷';
      default:
        return 'Español 🇲🇽';
    }
  }

  String _getCurrentCurrency() {
    final currencyService = Get.find<CurrencyService>();
    final currencies = {
      'COP': 'Peso Colombiano 🇨🇴',
      'MXN': 'Peso Mexicano 🇲🇽',
      'USD': 'US Dollar 🇺🇸',
      'BRL': 'Real Brasileiro 🇧🇷',
    };
    return currencies[currencyService.code] ?? currencyService.code;
  }
}