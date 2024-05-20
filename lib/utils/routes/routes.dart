import 'package:receipe/features/favourite_recipe/view/favourite_view.dart';
import 'package:receipe/features/recipe_detail/view/recipe_detail_view.dart';
import 'package:receipe/features/search_recipe/view/search_recipe_view.dart';

import '/core.dart';
import '../../features/home/view/home_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeView(),
        );

      case RoutesName.favouriteRecipeView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const FavouriteView(),
        );

      case RoutesName.searchRecipeView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SearchRecipeView(),
        );

      case RoutesName.recipeDetailView:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              RecipeDetailView(id: settings.arguments as int),
        );

      default:
        return MaterialPageRoute(builder: (BuildContext _) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
