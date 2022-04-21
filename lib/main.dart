import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/sorted_product.dart';
import 'models/boxes.dart';
import 'providers/providers.dart';
import 'screens/screens.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<bool>('local');
  await Hive.openBox<String>('auth');
  await Hive.openBox<bool>('isLogged');
  await Hive.openBox<bool>('isLiked');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var box = Boxes.getAuthBox();
    String? token = box.get('token');
    bool isToken;
    if(token != 'error' && token!='' && token!=null)
      isToken = true;
    else
      isToken = false;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => CacheManager(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: !isToken?'/splash_screen':'/home',
        routes: {
          '/log_in': (context) => const LoginScreen(),
          '/home': (context) => const Home(),
          '/sign_up': (context) => const SignUpScreen(),
          '/splash_screen': (context) => const SplashScreen(),
          '/settings': (context) => const Settings(),
          '/second_sign_up': (context) => const SecondSignUpScreen(),
          '/search': (context) => const SearchScreen(),
          '/products': (context) => const ProductsScreen(),
          '/categories': (context) => const CategoriesScreen(),
          '/sorted_products': (context) => const SortedProduct(),
        },
      ),
    );
  }

}
