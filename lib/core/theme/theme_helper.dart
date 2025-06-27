import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';

class ThemeHelper {
  // Obtener color de fondo según el tema
  static Color get background {
    return Get.isDarkMode ? AppColors.backgroundDark : AppColors.background;
  }
  
  // Obtener color de superficie según el tema
  static Color get surface {
    return Get.isDarkMode ? AppColors.surfaceDark : AppColors.surface;
  }
  
  // Obtener color de texto primario según el tema
  static Color get textPrimary {
    return Get.isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimary;
  }
  
  // Obtener color de texto secundario según el tema
  static Color get textSecondary {
    return Get.isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondary;
  }
  
  // Obtener color de tarjeta según el tema
  static Color get card {
    return Get.isDarkMode ? AppColors.cardDark : AppColors.surface;
  }
  
  // Obtener color del divisor según el tema
  static Color get divider {
    return Get.isDarkMode ? AppColors.dividerDark : Colors.grey.shade300;
  }
  
  // Los colores de marca se mantienen iguales en ambos temas
  static Color get primaryBlue => AppColors.primaryBlue;
  static Color get lightBlue => AppColors.lightBlue;
  static Color get success => AppColors.success;
  static Color get warning => AppColors.warning;
  static Color get error => AppColors.error;
  static Color get info => AppColors.info;
}