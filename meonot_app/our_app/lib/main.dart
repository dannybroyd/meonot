import 'package:our_app/pages/webview.dart';
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
  //color for theme
  //static Color color = Color.fromARGB(255, 137, 130, 202);
  // static MaterialColor mainColor  = MaterialColor(color.value, {
  //     50: Color.fromRGBO(color.red, color.green, color.blue, 0.1),
  //     100: Color.fromRGBO(color.red, color.green, color.blue, 0.2),
  //     200: Color.fromRGBO(color.red, color.green, color.blue, 0.3),
  //     300: Color.fromRGBO(color.red, color.green, color.blue, 0.4),
  //     400: Color.fromRGBO(color.red, color.green, color.blue, 0.5),
  //     500: Color.fromRGBO(color.red, color.green, color.blue, 0.6),
  //     600: Color.fromRGBO(color.red, color.green, color.blue, 0.7),
  //     700: Color.fromRGBO(color.red, color.green, color.blue, 0.8),
  //     800: Color.fromRGBO(color.red, color.green, color.blue, 0.9),
  //     900: Color.fromRGBO(color.red, color.green, color.blue, 1.0)
  // });


  // This widget is the root of your application.
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
        '/webpage' :(context) => const WebViewPage(),
      },
      theme: theme
    );
  }
}
