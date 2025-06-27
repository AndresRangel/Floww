import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../home/home_page.dart';

// Modelo temporal para los modos
class ModeItem {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final bool isPremium;

  ModeItem({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.isPremium = false,
  });
}

class ModeSelectionController extends GetxController {
  // Modo seleccionado
  final Rx<ModeItem?> selectedMode = Rx<ModeItem?>(null);
  
  // Lista de modos disponibles
  final List<ModeItem> availableModes = [
    ModeItem(
      id: 'loans',
      title: 'Préstamos',
      description: 'Gestiona préstamos con intereses',
      icon: Icons.account_balance_wallet,
      color: const Color(0xFF4CAF50),
      isPremium: false,
    ),
    ModeItem(
      id: 'sales',
      title: 'Ventas',
      description: 'Control de ventas e inventario',
      icon: Icons.shopping_cart,
      color: const Color(0xFF2196F3),
      isPremium: true,
    ),
    ModeItem(
      id: 'rent',
      title: 'Alquileres',
      description: 'Administra propiedades',
      icon: Icons.home,
      color: const Color(0xFFFF9800),
      isPremium: true,
    ),
    ModeItem(
      id: 'services',
      title: 'Servicios',
      description: 'Proyectos y servicios',
      icon: Icons.build,
      color: const Color(0xFF00BCD4),
      isPremium: true,
    ),
    ModeItem(
      id: 'education',
      title: 'Educación',
      description: 'Cursos y estudiantes',
      icon: Icons.school,
      color: const Color(0xFF9C27B0),
      isPremium: true,
    ),
    ModeItem(
      id: 'custom',
      title: 'Personalizado',
      description: 'Configura tu propio modo',
      icon: Icons.tune,
      color: const Color(0xFF607D8B),
      isPremium: true,
    ),
  ];

  void selectMode(ModeItem mode) {
    if (mode.isPremium) {
      // Mostrar mensaje de premium
      Get.snackbar(
        'Modo Premium',
        'Este modo estará disponible en la versión Pro',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.warning,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        duration: const Duration(seconds: 3),
      );
      
      // Por ahora, solo permitir seleccionar Préstamos
      if (mode.id != 'loans') {
        return;
      }
    }
    
    selectedMode.value = mode;
  }

  void continueToHome() {
    if (selectedMode.value == null) return;
    
    // Guardar el modo seleccionado (por ahora solo en memoria)
    // TODO: Guardar en SharedPreferences o Firebase
    
    // Navegar al home
    Get.off(() => const HomePage());
  }
}