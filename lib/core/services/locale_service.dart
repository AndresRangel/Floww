import 'dart:io';
import 'package:floww/core/services/currency_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleService {
  // Detectar el locale del dispositivo
  static Locale getDeviceLocale() {
    // Obtener el locale del sistema
    final String locale = Platform.localeName; // ej: "es_CO", "en_US"
    final parts = locale.split('_');
    
    if (parts.length >= 2) {
      return Locale(parts[0], parts[1]);
    } else {
      return Locale(parts[0]);
    }
  }
  
  // Obtener la moneda según el país
  static String getCurrencyForCountry(String countryCode) {
    switch (countryCode.toUpperCase()) {
      case 'CO':
        return 'COP'; // Colombia - Peso colombiano
      case 'MX':
        return 'MXN'; // México - Peso mexicano
      case 'AR':
        return 'ARS'; // Argentina - Peso argentino
      case 'BR':
        return 'BRL'; // Brasil - Real
      case 'PE':
        return 'PEN'; // Perú - Sol
      case 'CL':
        return 'CLP'; // Chile - Peso chileno
      case 'US':
        return 'USD'; // Estados Unidos - Dólar
      case 'ES':
        return 'EUR'; // España - Euro
      default:
        return 'USD'; // Por defecto
    }
  }
  
  // Configurar idioma y moneda automáticamente
  static void setupLocaleAndCurrency() {
    final locale = getDeviceLocale();
    
    // Establecer idioma
    Get.updateLocale(locale);
    
    // Establecer moneda según el país
    final countryCode = locale.countryCode ?? 'US';
    final currencyCode = getCurrencyForCountry(countryCode);
    
    // Actualizar el servicio de moneda
    final currencyService = Get.find<CurrencyService>();
    
    // Verificar que la moneda existe antes de cambiarla
    if (currencyService.currencies.containsKey(currencyCode)) {
      currencyService.currentCurrencyCode.value = currencyCode;
    }
  }
}