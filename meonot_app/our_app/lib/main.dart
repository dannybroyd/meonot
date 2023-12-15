import 'package:our_app/util/resources/importss.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(VisitorAdapter());
  var box = await Hive.openBox('myUserSettings');
  WidgetsFlutterBinding.ensureInitialized();
  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme =ThemeDecoder.decodeThemeData(themeJson);
  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.theme});
  final ThemeData? theme;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/profilepage' :(context) => const ProfilePage(),
        '/favoritespage' :(context) => const FavoritesPage(),
        '/maintenancepage' :(context) => const MaintenancePage(),
        '/addvisitorpage' :(context) => const AddVisitorPage(),
        '/homepage' :(context) => const HomePage(),
        '/overnightpage' :(context) => const OvernightRequestPage(),
        '/visitorpage' :(context) => const VisitorRequestPage(),
      },
      theme: theme
    );
  }
}
