import 'package:flutter/material.dart';
import 'package:flutter_group_1/screens/nav_bar_pages/categories_screen.dart';
import 'package:flutter_group_1/screens/nav_bar_pages/main_screen.dart';
import 'package:flutter_group_1/screens/nav_bar_pages/settings_screen.dart';
import 'package:flutter_group_1/screens/sign_in.dart';

class HomePage extends StatefulWidget {
  final String phoneNumber;
  const HomePage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<Widget> pages = [
    MainScreen(),
    CategoriesScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 2,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.exit_to_app), Text("Signout")],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: onNavBarTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  onNavBarTapped(int index) {
    pageIndex = index;
    setState(() {});
  }
}
