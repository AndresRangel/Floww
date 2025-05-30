import 'package:get/get.dart';

class HomeController extends GetxController {
  // Datos de ejemplo (después vendrán de Firebase)
  final String userName = 'Juan';
  final int pendingCollections = 3;
  
  void onActionTap(String action) {
    // Por ahora solo mostramos mensajes
    switch (action) {
      case 'collect':
        Get.snackbar(
          'Cobrar',
          'Funcionalidad de cobros próximamente',
          snackPosition: SnackPosition.BOTTOM,
        );
        break;
      case 'clients':
        Get.snackbar(
          'Clientes',
          'Lista de clientes próximamente',
          snackPosition: SnackPosition.BOTTOM,
        );
        break;
      case 'reports':
        Get.snackbar(
          'Reportes',
          'Reportes y estadísticas próximamente',
          snackPosition: SnackPosition.BOTTOM,
        );
        break;
      case 'history':
        Get.snackbar(
          'Historial',
          'Historial de transacciones próximamente',
          snackPosition: SnackPosition.BOTTOM,
        );
        break;
    }
  }
}