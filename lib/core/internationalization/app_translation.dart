import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'es_MX': {
      // General
      'app_name': 'Floww',
      'app_tagline': 'Fluye con tu dinero',
      'continue': 'Continuar',
      'cancel': 'Cancelar',
      'save': 'Guardar',
      'delete': 'Eliminar',
      'edit': 'Editar',
      'search': 'Buscar',
      'filter': 'Filtrar',
      'loading': 'Cargando...',
      'error': 'Error',
      'success': 'Éxito',
      'warning': 'Advertencia',
      'info': 'Información',
      
      // Auth
      'welcome_back': 'Bienvenido de vuelta',
      'create_account': 'Crear cuenta',
      'email': 'Correo electrónico',
      'password': 'Contraseña',
      'confirm_password': 'Confirmar contraseña',
      'full_name': 'Nombre completo',
      'login': 'Iniciar Sesión',
      'register': 'Registrarse',
      'forgot_password': '¿Olvidaste tu contraseña?',
      'no_account': '¿No tienes cuenta?',
      'have_account': '¿Ya tienes cuenta?',
      'terms_accept': 'Acepto los términos y condiciones',
      
      // Mode Selection
      'select_mode_title': '¿Qué tipo de negocio manejas?',
      'select_mode_subtitle': 'Selecciona uno para empezar. Podrás agregar más después.',
      'mode_loans': 'Préstamos',
      'mode_loans_desc': 'Gestiona préstamos con intereses',
      'mode_sales': 'Ventas',
      'mode_sales_desc': 'Control de ventas e inventario',
      'mode_rent': 'Alquileres',
      'mode_rent_desc': 'Administra propiedades',
      'mode_services': 'Servicios',
      'mode_services_desc': 'Proyectos y servicios',
      
      // Home
      'hello': 'Hola, @name 👋',
      'pending_collections': 'Tienes @count cobros pendientes hoy',
      'total_balance': 'Balance Total',
      'to_collect': 'Por cobrar',
      'collected_this_month': 'Cobrado este mes',
      'quick_actions': 'Acciones Rápidas',
      'collect': 'Cobrar',
      'clients': 'Clientes',
      'reports': 'Reportes',
      'history': 'Historial',
      'todays_collections': 'Cobros de Hoy',
      'see_all': 'Ver todos',
      'due_today': 'Vence hoy',
      'overdue': 'Vencido',
      'due_tomorrow': 'Vence mañana',
      
      // Loans specific
      'loan': 'Préstamo',
      'interest': 'Interés',
      'payment': 'Pago',
      'balance': 'Saldo',
      
      // Errors
      'error_required_field': 'Este campo es requerido',
      'error_invalid_email': 'Ingresa un correo válido',
      'error_password_short': 'La contraseña debe tener al menos 6 caracteres',
      'error_passwords_not_match': 'Las contraseñas no coinciden',
      'error_accept_terms': 'Debes aceptar los términos y condiciones',

        // Settings
  'settings': 'Configuración',
  'profile': 'Perfil',
  'language': 'Idioma',
  'currency': 'Moneda',
  'theme': 'Tema',
  'dark_mode': 'Modo oscuro',
  'light_mode': 'Modo claro',
  
  // Languages
  'spanish': 'Español',
  'english': 'Inglés',
  'portuguese': 'Portugués',
  
  // Countries/Currencies
  'colombia': 'Colombia',
  'mexico': 'México',
  'united_states': 'Estados Unidos',
  'brazil': 'Brasil',
    },
    
    'en_US': {
      // General
      'app_name': 'Floww',
      'app_tagline': 'Flow with your money',
      'continue': 'Continue',
      'cancel': 'Cancel',
      'save': 'Save',
      'delete': 'Delete',
      'edit': 'Edit',
      'search': 'Search',
      'filter': 'Filter',
      'loading': 'Loading...',
      'error': 'Error',
      'success': 'Success',
      'warning': 'Warning',
      'info': 'Information',
      
      // Auth
      'welcome_back': 'Welcome back',
      'create_account': 'Create account',
      'email': 'Email',
      'password': 'Password',
      'confirm_password': 'Confirm password',
      'full_name': 'Full name',
      'login': 'Sign In',
      'register': 'Sign Up',
      'forgot_password': 'Forgot password?',
      'no_account': "Don't have an account?",
      'have_account': 'Already have an account?',
      'terms_accept': 'I accept the terms and conditions',
      
      // Mode Selection
      'select_mode_title': 'What type of business do you manage?',
      'select_mode_subtitle': 'Select one to start. You can add more later.',
      'mode_loans': 'Loans',
      'mode_loans_desc': 'Manage loans with interest',
      'mode_sales': 'Sales',
      'mode_sales_desc': 'Sales and inventory control',
      'mode_rent': 'Rentals',
      'mode_rent_desc': 'Manage properties',
      'mode_services': 'Services',
      'mode_services_desc': 'Projects and services',
      
      // Home
      'hello': 'Hello, @name 👋',
      'pending_collections': 'You have @count pending collections today',
      'total_balance': 'Total Balance',
      'to_collect': 'To collect',
      'collected_this_month': 'Collected this month',
      'quick_actions': 'Quick Actions',
      'collect': 'Collect',
      'clients': 'Clients',
      'reports': 'Reports',
      'history': 'History',
      'todays_collections': "Today's Collections",
      'see_all': 'See all',
      'due_today': 'Due today',
      'overdue': 'Overdue',
      'due_tomorrow': 'Due tomorrow',
      
      // Loans specific
      'loan': 'Loan',
      'interest': 'Interest',
      'payment': 'Payment',
      'balance': 'Balance',
      
      // Errors
      'error_required_field': 'This field is required',
      'error_invalid_email': 'Enter a valid email',
      'error_password_short': 'Password must be at least 6 characters',
      'error_passwords_not_match': 'Passwords do not match',
      'error_accept_terms': 'You must accept the terms and conditions',

      'settings': 'Settings',
'profile': 'Profile',
'language': 'Language',
'currency': 'Currency',
'theme': 'Theme',
'dark_mode': 'Dark mode',
'light_mode': 'Light mode',

// Languages
'spanish': 'Spanish',
'english': 'English',
'portuguese': 'Portuguese',

// Countries/Currencies
'colombia': 'Colombia',
'mexico': 'Mexico',
'united_states': 'United States',
'brazil': 'Brazil',
    },
    
    'pt_BR': {
      // General
      'app_name': 'Floww',
      'app_tagline': 'Flua com seu dinheiro',
      'continue': 'Continuar',
      'cancel': 'Cancelar',
      'save': 'Salvar',
      'delete': 'Excluir',
      'edit': 'Editar',
      'search': 'Buscar',
      'filter': 'Filtrar',
      'loading': 'Carregando...',
      'error': 'Erro',
      'success': 'Sucesso',
      'warning': 'Aviso',
      'info': 'Informação',
      
      // Auth
      'welcome_back': 'Bem-vindo de volta',
      'create_account': 'Criar conta',
      'email': 'E-mail',
      'password': 'Senha',
      'confirm_password': 'Confirmar senha',
      'full_name': 'Nome completo',
      'login': 'Entrar',
      'register': 'Cadastrar',
      'forgot_password': 'Esqueceu sua senha?',
      'no_account': 'Não tem uma conta?',
      'have_account': 'Já tem uma conta?',
      'terms_accept': 'Aceito os termos e condições',
      
      // Mode Selection
      'select_mode_title': 'Que tipo de negócio você gerencia?',
      'select_mode_subtitle': 'Selecione um para começar. Você pode adicionar mais depois.',
      'mode_loans': 'Empréstimos',
      'mode_loans_desc': 'Gerencie empréstimos com juros',
      'mode_sales': 'Vendas',
      'mode_sales_desc': 'Controle de vendas e estoque',
      'mode_rent': 'Aluguéis',
      'mode_rent_desc': 'Administre propriedades',
      'mode_services': 'Serviços',
      'mode_services_desc': 'Projetos e serviços',
      
      // Home
      'hello': 'Olá, @name 👋',
      'pending_collections': 'Você tem @count cobranças pendentes hoje',
      'total_balance': 'Saldo Total',
      'to_collect': 'A receber',
      'collected_this_month': 'Recebido este mês',
      'quick_actions': 'Ações Rápidas',
      'collect': 'Cobrar',
      'clients': 'Clientes',
      'reports': 'Relatórios',
      'history': 'Histórico',
      'todays_collections': 'Cobranças de Hoje',
      'see_all': 'Ver todos',
      'due_today': 'Vence hoje',
      'overdue': 'Vencido',
      'due_tomorrow': 'Vence amanhã',
      
      // Loans specific
      'loan': 'Empréstimo',
      'interest': 'Juros',
      'payment': 'Pagamento',
      'balance': 'Saldo',
      
      // Errors
      'error_required_field': 'Este campo é obrigatório',
      'error_invalid_email': 'Digite um e-mail válido',
      'error_password_short': 'A senha deve ter pelo menos 6 caracteres',
      'error_passwords_not_match': 'As senhas não coincidem',
      'error_accept_terms': 'Você deve aceitar os termos e condições',

      // Settings
'settings': 'Configurações',
'profile': 'Perfil',
'language': 'Idioma',
'currency': 'Moeda',
'theme': 'Tema',
'dark_mode': 'Modo escuro',
'light_mode': 'Modo claro',

// Languages
'spanish': 'Espanhol',
'english': 'Inglês',
'portuguese': 'Português',

// Countries/Currencies
'colombia': 'Colômbia',
'mexico': 'México',
'united_states': 'Estados Unidos',
'brazil': 'Brasil',
    },
  };
}