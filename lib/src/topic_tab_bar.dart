import 'package:flutter/material.dart';

class TabBarRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Drawer Header'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'DARK',
              style: TextStyle(
//                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Raleway'),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          bottomNavigationBar: tabBarMenu(),
          body: TabBarView(
            children: [
              Icon(Icons.home),
              Icon(Icons.favorite),
              Icon(Icons.category),
              Icon(Icons.add_shopping_cart),
              Icon(Icons.person),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBarMenu() {
    return Container(
      width: 100.0,
      color: Colors.transparent,
      child: TabBar(
        labelStyle: TextStyle(
          fontSize: 8.0,
        ),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(
            text: "HOME",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "WISHLIST",
            icon: Icon(Icons.favorite),
          ),
          Tab(
            text: "CATEGORIES",
            icon: Icon(Icons.category),
          ),
          Tab(
            text: "MY BAG",
            icon: Icon(Icons.add_shopping_cart),
          ),
          Tab(
            text: "PROFILE",
            icon: Icon(Icons.account_box),
          ),
        ],
      ),
    );
  }
}
