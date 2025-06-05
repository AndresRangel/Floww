import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CurrencyService extends GetxService {
  // Moneda actual - Colombia por defecto
  final RxString currentCurrencyCode = 'COP'.obs;
  
  // Símbolos de moneda como constantes
  static const String dollarSign = '\$';
  static const String realSign = 'R\$';
  
  // Mapa de configuraciones de moneda
  final Map<String, Map<String, dynamic>> currencies = {
    'COP': {
      'symbol': dollarSign,
      'locale': 'es_CO',
      'decimals': 0,
      'name': 'Peso Colombiano',
    },
    'MXN': {
      'symbol': dollarSign,
      'locale': 'es_MX', 
      'decimals': 2,
      'name': 'Peso Mexicano',
    },
    'USD': {
      'symbol': dollarSign,
      'locale': 'en_US',
      'decimals': 2,
      'name': 'US Dollar',
    },
    'BRL': {
      'symbol': realSign,
      'locale': 'pt_BR',
      'decimals': 2,
      'name': 'Real Brasileiro',
    },
  };
  
  // Inicializar servicio
  Future<CurrencyService> init() async {
    // TEMPORAL: Forzar COP para Colombia
    currentCurrencyCode.value = 'COP';
    print('CurrencyService iniciado con COP (Colombia)');
    return this;
  }
  
  // Cambiar moneda por código
  void changeCurrencyByCode(String code) {
    if (currencies.containsKey(code)) {
      currentCurrencyCode.value = code;
    }
  }
  
  // Formatear cantidad según la moneda actual
  String format(double amount) {
    final config = currencies[currentCurrencyCode.value]!;
    
    print('Formateando $amount con moneda ${currentCurrencyCode.value}');
    
    // Para Colombia y Chile (sin decimales)
    if (config['decimals'] == 0) {
      // Formato manual para asegurar que funcione
      final intAmount = amount.round();
      final formatted = intAmount.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]}.',
      );
      return '${config['symbol']} $formatted';
    }
    
    // Para otras monedas con decimales
    try {
      final formatter = NumberFormat.currency(
        locale: config['locale'],
        symbol: config['symbol'],
        decimalDigits: config['decimals'],
      );
      return formatter.format(amount);
    } catch (e) {
      print('Error formateando: $e');
      // Formato de respaldo
      return '${config['symbol']} ${amount.toStringAsFixed(config['decimals'])}';
    }
  }
  
  // Obtener símbolo de la moneda actual
  String get symbol {
    final config = currencies[currentCurrencyCode.value];
    return config?['symbol'] as String? ?? dollarSign;
  }
  
  // Obtener código de la moneda actual
  String get code => currentCurrencyCode.value;
}