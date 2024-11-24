import '../models/agency.dart';
import '../models/category.dart';
import '../models/favorite.dart';
import '../models/module.dart';

List<Module> modulos = [
  Module(name: 'Gestión de Reservas', icon: 'event'),
  Module(name: 'Gestión de Clientes', icon: 'person'),
  Module(name: 'Facturación y Pagos', icon: 'receipt_long'),
  Module(name: 'Administración de Inventario', icon: 'inventory_2'),
  Module(name: 'Gestión de Paquetes Turísticos', icon: 'card_travel'),
  Module(name: 'Análisis y Reportes', icon: 'bar_chart'),
  Module(name: 'Marketing y Promociones', icon: 'campaign', state: false),
  Module(name: 'Gestión de Usuarios y Roles', icon: 'manage_accounts', state: false),
  Module(name: 'Seguimiento de Viajes', icon: 'location_on'),
];

List<Category> categorias = [
  Category(id: 1, name: 'Aventura'),
  Category(id: 2, name: 'Cultural'),
  Category(id: 3, name: 'Gastronómico'),
  Category(id: 4, name: 'Playa y Sol'),
  Category(id: 5, name: 'Familiar'),
  Category(id: 6, name: 'Negocio'),
  Category(id: 7, name: 'Deporte'),
  Category(id: 8, name: 'Relajación y Bienestar'),
  Category(id: 9, name: 'Naturaleza'),
];

List<Agency> agencias = [
  // Agency(
  //   id: 1,
  //   ruc: '20100912768',
  //   companyName: 'TRAVEL GROUP PERU S.A.',
  //   email: 'travelgroup@travelgroup.com.pe',
  //   services: 'Dripice • Escape • 2016',
  //   description:
  //       'Somos una Agencia de Viajes y Tour Operador que cuenta con 42 años de experiencia ininterrumpida en el mercado. Somos una empresa líder especializada en la gestión de necesidades de viajes de negocios y en la provisión de productos turísticos y de negocios requeridos por clientes corporativos, con una estructura organizativa que se adapta a las necesidades de cada cliente para ofrecer un servicio específico e integral, que cuenta con innovadoras herramientas tecnológicas, asistencia personalizada y servicio con alcance global.',
  //   location: 'Lima',
  //   category: categorias[0],
  // ),
  // Agency(
  //     id: 2,
  //     ruc: '20610247033',
  //     companyName: 'MEDIA TRAVEL GROUP S.A.C.',
  //     location: 'Lima',
  //     category: categorias[1]),
  // Agency(
  //     id: 3,
  //     ruc: '20448459978',
  //     companyName:
  //         'PUNO TOURS SERVICIOS TURISTICOS EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA',
  //     location: 'Puno',
  //     category: categorias[2]),
  // Agency(
  //     id: 4,
  //     ruc: '20534780185',
  //     companyName: 'E & N HUAMANGA TOURS S.R.L.',
  //     location: 'Huamanga',
  //     category: categorias[3]),
  // Agency(
  //     id: 5,
  //     ruc: '20605213015',
  //     companyName: 'AGENCIA DE VIAJES Y TURISMO AYACUCHO TRAVEL E.I.R.L.',
  //     location: 'Huamanga',
  //     category: categorias[4]),
  // Agency(
  //     id: 6,
  //     ruc: '20606832509',
  //     companyName:
  //         'AGENCIA DE VIAJES Y TURISMO OPERADOR DE TURISMO HUANCARAYLLA TRAVEL S.R.L.',
  //     location: 'Huamanga',
  //     category: categorias[5]),
  // Agency(
  //     id: 7,
  //     ruc: '20600693701',
  //     companyName: 'VIAJES EXPRESS TRAVEL PERU S.A.C.',
  //     location: 'Lima',
  //     category: categorias[6]),
  // Agency(
  //     id: 8,
  //     ruc: '20452714125',
  //     companyName: 'MOROCHUCOS REPS S.R.L.',
  //     location: 'Huamanga',
  //     category: categorias[7]),
  // Agency(
  //     id: 9,
  //     ruc: '20602780911',
  //     companyName: 'APU KUNTUR TRAVEL E.I.R.L.',
  //     location: 'Lucanas',
  //     category: categorias[0]),
  // Agency(
  //     id: 10,
  //     ruc: '20601738636',
  //     companyName: 'AGENCIA DE VIAJES Y TURISMO ZAMY E.I.R.L.',
  //     location: 'Huamanga',
  //     category: categorias[0]),
];

List<Favorite> favoritos = [
  // Favorite(id: 1, agency: agencias[0]),
  // Favorite(id: 2, agency: agencias[1]),
  // Favorite(id: 3, agency: agencias[2]),
  // Favorite(id: 4, agency: agencias[3]),
  // Favorite(id: 5, agency: agencias[4]),
];
