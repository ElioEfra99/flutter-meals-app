import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/favorites_screen.dart';
import 'package:flutter_meals_app/screens/tabs_screen.dart';

import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.lime,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // Default is '/'
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) { // reached if you're going to a named route with pushName(), that is nor registered in routes table
        print(settings.arguments);            // We don't need it and it is not needed all the time
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen()); 
      }, 
      onUnknownRoute: (settings) { // Reached when flutter failed to build a screen, before it throws an error
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen()); // Prevent user seeing crash screens
      }, // Like 404 error page
    );
  }
}
