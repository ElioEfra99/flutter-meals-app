import 'package:flutter/material.dart';

import '../widget/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  _selectPage(int index) {
    // Flutter Automatically provides index parameter
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
        // 'actions': FlatButton(),
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Favorites',
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _selectPage, // Flutter Automatically provides index parameter
        backgroundColor: Theme.of(context).primaryColor,
        // type: BottomNavigationBarType.shifting,
        // type: BottomNavigationBarType.fixed,  // Default behaviour
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite_border),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(
    //         tabs: <Widget>[
    //           Tab(
    //             icon: Icon(
    //               Icons.category,
    //             ),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(
    //               Icons.star,
    //             ),
    //             text: 'Favorites',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(children: <Widget>[
    //       CategoriesScreen(),
    //       FavoritesScreen(),
    //     ],),
    //   ),
    // );
  }
}
