import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_manager.dart';
import '../screens/screens.dart';
import '../models/models.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static List<Widget> pages = <Widget>[
    const Settings(),
    const Profile(),
    const ProductsScreen(),
    const CategoriesScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsManager>(builder: (context, manager, child) {
      bool isEng = manager.getLocal();
      return Scaffold(
        body: IndexedStack(index: manager.selectedTab, children: pages),
        bottomNavigationBar: CurvedNavigationBar(
          // unselectedItemColor: Colors.blueGrey[200],
          // unselectedLabelStyle: TextStyle(
          //   color: Colors.blueGrey[200],
          // ),
          // selectedItemColor: Colors.white,
          // selectedLabelStyle: const TextStyle(
          //   color: Colors.white,
          // ),
          // showUnselectedLabels: true,
          // currentIndex: manager.selectedTab,
          onTap: (index) {
            manager.goToTab(index);
          },
          index: manager.selectedTab,
          backgroundColor: Colors.transparent,
          color: Colors.blueGrey,
          height: 60,
          items: const [
            Icon(Icons.settings,color: Colors.white,size: 30,),
            Icon(Icons.person,color: Colors.white,size: 30,),
            Icon(Icons.home,color: Colors.white,size: 30,),
            Icon(Icons.category,color: Colors.white,size: 30,),
            Icon(Icons.search,color: Colors.white,size: 30,),
          ],
          // items:  <BottomNavigationBarItem>[
          //   BottomNavigationBarItem(
          //     icon: const Icon(Icons.settings),
          //     label: isEng?'Settings':'الاعدادات',
          //     backgroundColor: Colors.blueGrey,
          //   ),
          //   BottomNavigationBarItem(
          //       icon: const Icon(Icons.person),
          //       backgroundColor: Colors.blueGrey,
          //       label: isEng?'Profile':'حسابي'),
          //   BottomNavigationBarItem(
          //     icon: const Icon(Icons.home),
          //     backgroundColor: Colors.blueGrey,
          //     label: isEng?'Home':'الرئيسية',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: const Icon(Icons.category),
          //     label: isEng?'Categories':'الأصناف',
          //     backgroundColor: Colors.blueGrey,
          //   ),
          //   BottomNavigationBarItem(
          //     icon: const Icon(
          //       Icons.search,
          //     ),
          //     label: isEng?'Search':'بحث',
          //     backgroundColor: Colors.blueGrey,
          //   ),
          // ],
        ),
      );
    });
  }
}
