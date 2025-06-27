import 'package:floww/core/internationalization/app_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'core/theme/app_theme.dart';
import 'core/services/currency_service.dart';
import 'core/services/locale_service.dart';
import 'presentation/pages/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar servicios
  await initServices();
  
  // Configurar orientación (solo vertical)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const FlowwApp());
}

// Inicializar servicios globales
Future<void> initServices() async {
  print('=== Iniciando servicios ===');
  
  // Inicializar CurrencyService
  final currencyService = await Get.putAsync(() => CurrencyService().init());
  print('CurrencyService iniciado con: ${currencyService.code}');
  
  // Pequeño delay para asegurar que el servicio esté listo
  await Future.delayed(const Duration(milliseconds: 100));
  
  // Detectar y configurar idioma/moneda automáticamente
  try {
    print('Llamando a LocaleService.setupLocaleAndCurrency()...');
    LocaleService.setupLocaleAndCurrency();
    print('LocaleService ejecutado correctamente');
    print('Moneda final: ${currencyService.code}');
  } catch (e, stackTrace) {
    print('Error configurando LocaleService: $e');
    print('StackTrace: $stackTrace');
  }
}

class FlowwApp extends StatelessWidget {
  const FlowwApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Floww',
      debugShowCheckedModeBanner: false,
      
      // Temas
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // Tema claro por defecto
      
      // Internacionalización
      translations: AppTranslations(),
      locale: const Locale('es', 'CO'), // Forzar español Colombia
      fallbackLocale: const Locale('en', 'US'),
      
      home: const SplashPage(),
      
      // Configuración de GetX
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
      
      // Prevenir que el texto sea muy grande o muy pequeño
      builder: (context, child) {
        // Actualizar barra de estado según el tema
        final brightness = Theme.of(context).brightness;
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: brightness == Brightness.dark 
                ? Brightness.light 
                : Brightness.dark,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
            systemNavigationBarIconBrightness: brightness == Brightness.dark 
                ? Brightness.light 
                : Brightness.dark,
          ),
        );
        
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(
              MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.2),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}