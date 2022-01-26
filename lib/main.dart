import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/providers.dart';
import 'models/models.dart';
import 'screens/screens.dart';
import '../components/components.dart';

void main() {
  runApp(const MyApp());
}

/*final List<Product> products = [
  Product(
    name: 'pro1',
    image: 'assets/pro1.jpg',
    expireDate: DateTime.now(),
    category: Category(name: 'cate1'),
    ownerId: 1,
    contactNumber: 1,
    quantity: 7,
    price: Price(
      firstSale: 23,
      secondSale: 3,
      thirdSale: 5,
      price: 4,
    ),
    facebookUrl: 'www',
  ),
  Product(
    name: 'pro2',
    image: 'assets/pro2.jpg',
    expireDate: DateTime.now(),
    category: Category(name: 'cate1'),
    ownerId: 1,
    contactNumber: 1,
    quantity: 1,
    price: Price(
      firstSale: 23,
      secondSale: 3,
      thirdSale: 5,
      price: 4,
    ),
    facebookUrl: 'www',
  ),
  Product(
    name: 'pro3',
    image: 'assets/pro3.jpg',
    expireDate: DateTime.now(),
    category: Category(name: 'cate1'),
    ownerId: 1,
    contactNumber: 1,
    quantity: 1,
    price: Price(
      firstSale: 23,
      secondSale: 3,
      thirdSale: 5,
      price: 4,
    ),
    facebookUrl: 'www',
  ),
  Product(
    name: 'pro4',
    image: 'assets/pro4.jpg',
    expireDate: DateTime.now(),
    category: Category(name: 'cate1'),
    ownerId: 1,
    contactNumber: 1,
    quantity: 1,
    price: Price(
      firstSale: 23,
      secondSale: 3,
      thirdSale: 5,
      price: 4,
    ),
    facebookUrl: 'www',
  ),
  Product(
    name: 'pro1',
    image: 'assets/pro1.jpg',
    expireDate: DateTime.now(),
    category: Category(name: 'cate1'),
    ownerId: 1,
    contactNumber: 1,
    quantity: 1,
    price: Price(
      firstSale: 23,
      secondSale: 3,
      thirdSale: 5,
      price: 4,
    ),
    facebookUrl: 'www',
  ),
  Product(
    name: 'pro2',
    image: 'assets/pro2.jpg',
    expireDate: DateTime.now(),
    category: Category(name: 'cate1'),
    ownerId: 1,
    contactNumber: 1,
    quantity: 1,
    price: Price(
      firstSale: 23,
      secondSale: 3,
      thirdSale: 5,
      price: 4,
    ),
    facebookUrl: 'www',
  ),
  Product(
    name: 'pro3',
    image: 'assets/pro3.jpg',
    expireDate: DateTime.now(),
    category: Category(name: 'cate1'),
    ownerId: 1,
    contactNumber: 1,
    quantity: 1,
    price: Price(
      firstSale: 23,
      secondSale: 3,
      thirdSale: 5,
      price: 4,
    ),
    facebookUrl: 'www',
  ),
  Product(
    name: 'pro4',
    image: 'assets/pro4.jpg',
    expireDate: DateTime.now(),
    category: Category(name: 'cate1'),
    ownerId: 1,
    contactNumber: 1,
    quantity: 1,
    price: Price(
      firstSale: 23,
      secondSale: 3,
      thirdSale: 5,
      price: 4,
    ),
    facebookUrl: 'www',
  ),
  Product(
    name: 'pro1',
    image: 'assets/pro1.jpg',
    expireDate: DateTime.now(),
    category: Category(name: 'cate1'),
    ownerId: 1,
    contactNumber: 1,
    quantity: 1,
    price: Price(
      firstSale: 23,
      secondSale: 3,
      thirdSale: 5,
      price: 4,
    ),
    facebookUrl: 'www',
  ),
  Product(
    name: 'pro2',
    image: 'assets/pro2.jpg',
    expireDate: DateTime.now(),
    category: Category(name: 'cate1'),
    ownerId: 1,
    contactNumber: 1,
    quantity: 1,
    price: Price(
      firstSale: 23,
      secondSale: 3,
      thirdSale: 5,
      price: 4,
    ),
    facebookUrl: 'www',
  ),
  Product(
    name: 'pro3',
    image: 'assets/pro3.jpg',
    expireDate: DateTime.now(),
    category: Category(name: 'cate1'),
    ownerId: 1,
    contactNumber: 1,
    quantity: 1,
    price: Price(
      firstSale: 23,
      secondSale: 3,
      thirdSale: 5,
      price: 4,
    ),
    facebookUrl: 'www',
  ),
  Product(
    name: 'pro4',
    image: 'assets/pro4.jpg',
    expireDate: DateTime.now(),
    category: Category(name: 'cate1'),
    ownerId: 1,
    contactNumber: 1,
    quantity: 1,
    price: Price(
      firstSale: 23,
      secondSale: 3,
      thirdSale: 5,
      price: 4,
    ),
    facebookUrl: 'www',
  ),
];
*/
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsManager(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash_screen',
        routes: {
          '/log_in': (context) => const LoginScreen(),
          '/home': (context) => const Home(),
          '/sign_up': (context) => const SignUpScreen(),
          '/splash_screen': (context) => const SplashScreen(),
      ///TODO:edit
          '/details': (context) => DetailsScreen(products: []),
          '/settings': (context) => const Settings(),
          '/second_sign_up': (context) => const SecondSignUpScreen(),
          '/search':(context)=> const SearchScreen(),
          '/products':(context)=> const ProductsScreen(),
        },
      ),
    );
  }
}
