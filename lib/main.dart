import 'package:flutter/material.dart';
import 'package:new_recipe_app/shayanrecipe_theme.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(
    const ShayanRecipes(),
  );
}

class ShayanRecipes extends StatefulWidget {
  const ShayanRecipes({Key? key}) : super(key: key);

  @override
  _ShayanRecipesState createState() => _ShayanRecipesState();
}

class _ShayanRecipesState extends State<ShayanRecipes> {
  final _groceryManager = GroceryManager();
  final _profileManager = ProfileManager();
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      groceryManager: _groceryManager,
      profileManager: _profileManager,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _groceryManager),
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        )
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = ShayanRecipeTheme.dark();
          } else {
            theme = ShayanRecipeTheme.light();
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            title: 'Shayan\'s Recipes',
            home: Router(
              routerDelegate: _appRouter,
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          );
        },
      ),
    );
  }
}