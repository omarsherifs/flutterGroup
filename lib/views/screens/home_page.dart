import 'package:flutter/material.dart';
import 'package:flutter_group_1/core/settings_util.dart';
import 'package:flutter_group_1/views/screens/add_category_page.dart';
import 'package:flutter_group_1/views/screens/nav_bar_pages/categories_screen.dart';
import 'package:flutter_group_1/views/screens/nav_bar_pages/main_screen.dart';
import 'package:flutter_group_1/views/screens/nav_bar_pages/settings_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  String userEmail = "";
  List<Widget> pages = [
    const MainScreen(),
    const CategoriesScreen(),
    const SettingsScreen(),
  ];
  @override
  void initState() {
    super.initState();
    getUserEmail();
  }

  Future<void> getUserEmail() async {
    userEmail = await SettingsUtil.getCachedUserEmail();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.7,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 150,
              color: Colors.blue,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                      Text("User Name"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Email: $userEmail")],
                  )
                ],
              ),
            ),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                )),
            InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddCategoryPage()),
                  );
                },
                child: const ListTile(
                  leading: Icon(Icons.add_shopping_cart),
                  title: Text("Add category"),
                )),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text("Cart"),
                )),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                )),
            const Divider(),
            InkWell(
                onTap: () async {
                  SettingsUtil.signOutFlow(context);
                },
                child: const ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Sign out"),
                ))
          ],
        ),
      ),
      appBar: AppBar(),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: onNavBarTapped,
        items: const [
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
