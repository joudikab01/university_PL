import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/sorted_product.dart';
import 'models/boxes.dart';
import 'models/signup_models/user.dart';
import 'providers/providers.dart';
import 'screens/screens.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserSignAdapter());
  await Hive.openBox<bool>('local');
  await Hive.openBox<String>('auth');
  await Hive.openBox<bool>('isLiked');
  await Hive.openBox<UserSign>('user');
  const firebaseConfig = FirebaseOptions(
      apiKey: "AIzaSyDYiyf1nxtJiS_OMgmajJQtaMk5y_b2WSg",
      authDomain: "e-commerce-8c4be.firebaseapp.com",
      projectId: "e-commerce-8c4be",
      storageBucket: "e-commerce-8c4be.appspot.com",
      messagingSenderId: "997454701642",
      appId: "1:997454701642:web:6f440d9bb2965affd9b2b3",
      measurementId: "G-0MBJBW5FSH");
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: firebaseConfig,
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // late GoogleMapController mapController;
  //
  // final LatLng _center = const LatLng(45.521563, -122.677433);
  //
  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  @override
  Widget build(BuildContext context) {
    var box = Boxes.getAuthBox();
    String? token = box.get('token');
    bool isToken;
    if (token != 'error' && token != '' && token != null)
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
        ),
        StreamProvider.value(
          value: FirebaseAuth.instance.authStateChanges(),
          initialData: 0,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: const Text('Maps Sample App'),
        //     backgroundColor: Colors.green[700],
        //   ),
        //   body: GoogleMap(
        //     onMapCreated: _onMapCreated,
        //     initialCameraPosition: CameraPosition(
        //       target: _center,
        //       zoom: 11.0,
        //     ),
        //   ),
        //),
        home: SecondSignUpScreen(),
        //initialRoute: !isToken ? '/splash_screen' : '/home',
        routes: {
          '/log_in': (context) => const LoginScreen(),
          '/home': (context) => const Home(),
          '/sign_up': (context) =>  const SignUpScreen(),
          '/splash_screen': (context) => const SplashScreen(),
          '/settings': (context) => const Settings(),
          '/second_sign_up': (context) => const SecondSignUpScreen(),
          '/search': (context) => const SearchScreen(),
          '/products': (context) => const ProductsScreen(),
          '/categories': (context) => const CategoriesScreen(),
          '/sorted_products': (context) => const SortedProduct(),
          '/verification': (context) =>const VerificationCode(),
        },
      ),
    );
  }
}
