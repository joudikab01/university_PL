import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_project/providers/products_manager.dart';
import '../screens/screens.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static List<Widget> pages = <Widget>[
    const Settings(),
    const ProductsScreen(),
    const SearchScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsManager>(
      builder: (context,manager,child){
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.blueGrey,
            title: const Text(
              'Products',
            ),
            centerTitle: true,
          ),
          body: IndexedStack(index: manager.selectedTab, children: pages),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.blueGrey[200],
            unselectedLabelStyle: TextStyle(
              color: Colors.blueGrey[200],
            ),
            selectedItemColor: Colors.white,
            selectedLabelStyle: const TextStyle(
              color: Colors.white,
            ),
            showUnselectedLabels: true,
            currentIndex: manager.selectedTab,
            onTap: (index) {
              manager.goToTab(index);
            },
            backgroundColor: Colors.blueGrey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.blueGrey,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                backgroundColor: Colors.blueGrey,
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Search',
                backgroundColor: Colors.blueGrey,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  backgroundColor: Colors.blueGrey,
                  label: 'Profile'),
            ],
          ),
        );
      }
    );
  }
}
