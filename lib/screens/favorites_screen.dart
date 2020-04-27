import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen(this.favoriteMeal);

  final List<Meal> favoriteMeal;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeal[index].id,
            title: favoriteMeal[index].title,
            imageUrl: favoriteMeal[index].imageUrl,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            affordability: favoriteMeal[index].affordability,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
