import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/currency_service.dart';

// Función helper para abrir el selector
void showLanguageCurrencySelector(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const LanguageCurrencySelector(),
  );
}

class LanguageCurrencySelector extends StatelessWidget {
  const LanguageCurrencySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Title
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'settings'.tr,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Language Section
                  _buildSectionTitle('language'.tr),
                  _buildLanguageOptions(),
                  
                  const SizedBox(height: 20),
                  
                  // Currency Section
                  _buildSectionTitle('currency'.tr),
                  _buildCurrencyOptions(),
                  
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Theme.of(Get.context!).colorScheme.surface.withOpacity(0.5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Theme.of(Get.context!).textTheme.bodyMedium!.color!.withOpacity(0.6),
        ),
      ),
    );
  }

  Widget _buildLanguageOptions() {
    final currentLocale = Get.locale;
    
    final languages = [
      {
        'code': 'es',
        'country': 'MX',
        'name': 'spanish'.tr,
        'flag': '🇲🇽',
        'locale': const Locale('es', 'MX'),
      },
      {
        'code': 'en',
        'country': 'US',
        'name': 'english'.tr,
        'flag': '🇺🇸',
        'locale': const Locale('en', 'US'),
      },
      {
        'code': 'pt',
        'country': 'BR',
        'name': 'portuguese'.tr,
        'flag': '🇧🇷',
        'locale': const Locale('pt', 'BR'),
      },
    ];

    return Column(
      children: languages.map((lang) {
        final isSelected = currentLocale?.languageCode == lang['code'];
        
        return ListTile(
          leading: Text(
            lang['flag'] as String,
            style: const TextStyle(fontSize: 24),
          ),
          title: Text(
            lang['name'] as String,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          trailing: isSelected
              ? Icon(
                  Icons.check_circle,
                  color: AppColors.primaryBlue,
                )
              : null,
          onTap: () {
            Get.updateLocale(lang['locale'] as Locale);
            // Opcional: Mostrar snackbar de confirmación
            Get.snackbar(
              'success'.tr,
              'Idioma actualizado',
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildCurrencyOptions() {
    final currencyService = Get.find<CurrencyService>();
    
    final currencies = [
      {
        'code': 'COP',
        'name': 'Peso Colombiano',
        'flag': '🇨🇴',
        'symbol': '\$',
      },
      {
        'code': 'MXN',
        'name': 'Peso Mexicano',
        'flag': '🇲🇽',
        'symbol': '\$',
      },
      {
        'code': 'USD',
        'name': 'US Dollar',
        'flag': '🇺🇸',
        'symbol': '\$',
      },
      {
        'code': 'BRL',
        'name': 'Real Brasileiro',
        'flag': '🇧🇷',
        'symbol': 'R\$',
      },
    ];

    return Obx(() => Column(
      children: currencies.map((currency) {
        final isSelected = currencyService.currentCurrencyCode.value == currency['code'];
        
        return ListTile(
          leading: Text(
            currency['flag'] as String,
            style: const TextStyle(fontSize: 24),
          ),
          title: Text(
            currency['name'] as String,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          subtitle: Text(
            '${currency['symbol']} ${currency['code']}',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(Get.context!).textTheme.bodyMedium!.color!.withOpacity(0.6),
            ),
          ),
          trailing: isSelected
              ? Icon(
                  Icons.check_circle,
                  color: AppColors.primaryBlue,
                )
              : null,
          onTap: () {
            currencyService.changeCurrencyByCode(currency['code'] as String);
            // Opcional: Mostrar snackbar de confirmación
            Get.snackbar(
              'success'.tr,
              'Moneda actualizada a ${currency['name']}',
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2),
            );
          },
        );
      }).toList(),
    ));
  }
}