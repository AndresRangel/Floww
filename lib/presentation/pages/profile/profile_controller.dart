import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileController extends GetxController {
  // Datos del usuario
  final userName = 'Juan Pérez'.obs;
  final userEmail = 'juan@example.com'.obs;
  final userPhotoPath = ''.obs;
  
  // Tema
  final isDarkMode = false.obs;
  
  // Loading states
  final isLoading = false.obs;
  final isUploadingPhoto = false.obs;
  
  final ImagePicker _picker = ImagePicker();
  
  @override
  void onInit() {
    super.onInit();
    // Cargar datos del usuario y preferencias
    loadUserData();
    loadThemePreference();
  }
  
  void loadUserData() {
    // TODO: Cargar desde Firebase o almacenamiento local
    // Por ahora usamos datos de ejemplo
  }
  
  void loadThemePreference() {
    // TODO: Cargar preferencia de tema guardada
    // isDarkMode.value = Get.isDarkMode;
  }
  
  // Cambiar foto de perfil
  Future<void> changeProfilePhoto() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 70,
      );
      
      if (image != null) {
        isUploadingPhoto.value = true;
        
        // TODO: Subir a Firebase Storage
        userPhotoPath.value = image.path;
        
        Get.snackbar(
          'success'.tr,
          'Foto actualizada correctamente',
          snackPosition: SnackPosition.BOTTOM,
        );
        
        isUploadingPhoto.value = false;
      }
    } catch (e) {
      isUploadingPhoto.value = false;
      Get.snackbar(
        'error'.tr,
        'No se pudo actualizar la foto',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  
  // Tomar foto con cámara
  Future<void> takeProfilePhoto() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 70,
      );
      
      if (image != null) {
        isUploadingPhoto.value = true;
        
        // TODO: Subir a Firebase Storage
        userPhotoPath.value = image.path;
        
        Get.snackbar(
          'success'.tr,
          'Foto actualizada correctamente',
          snackPosition: SnackPosition.BOTTOM,
        );
        
        isUploadingPhoto.value = false;
      }
    } catch (e) {
      isUploadingPhoto.value = false;
      Get.snackbar(
        'error'.tr,
        'No se pudo tomar la foto',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  
  // Cambiar tema
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    
    // TODO: Guardar preferencia
    Get.snackbar(
      'success'.tr,
      isDarkMode.value ? 'Modo oscuro activado' : 'Modo claro activado',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  // Cambiar contraseña
  void changePassword() {
    // TODO: Implementar cambio de contraseña
    Get.snackbar(
      'Próximamente',
      'Cambio de contraseña estará disponible pronto',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  // Cerrar sesión
  Future<void> logout() async {
    // Mostrar diálogo de confirmación
    final confirm = await Get.dialog<bool>(
      AlertDialog(
        title: Text('Cerrar Sesión'),
        content: Text('¿Estás seguro de que quieres cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text('cancel'.tr),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text('Cerrar Sesión'),
          ),
        ],
      ),
    );
    
    if (confirm == true) {
      isLoading.value = true;
      
      // TODO: Cerrar sesión en Firebase
      await Future.delayed(Duration(seconds: 1)); // Simular proceso
      
      // Limpiar datos y navegar a login
      Get.offAllNamed('/login');
    }
  }
  
  // Mostrar opciones de foto
  void showPhotoOptions() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Tomar foto'),
              onTap: () {
                Get.back();
                takeProfilePhoto();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Elegir de galería'),
              onTap: () {
                Get.back();
                changeProfilePhoto();
              },
            ),
            if (userPhotoPath.value.isNotEmpty)
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text('Eliminar foto', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Get.back();
                  userPhotoPath.value = '';
                },
              ),
          ],
        ),
      ),
    );
  }
}