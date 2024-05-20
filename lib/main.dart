import 'package:hive_flutter/adapters.dart';
import 'package:receipe/features/home/model/recipe_model.dart';

import '/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  Hive.registerAdapter(ExtendedIngredientAdapter());
  Hive.registerAdapter(MeasuresAdapter());
  Hive.registerAdapter(MetricAdapter());
  Hive.registerAdapter(AnalyzedInstructionAdapter());
  Hive.registerAdapter(LengthAdapter());
  Hive.registerAdapter(EntAdapter());
  Hive.registerAdapter(StepAdapter());
  Hive.registerAdapter(NutritionAdapter());
  Hive.registerAdapter(CaloricBreakdownAdapter());
  Hive.registerAdapter(FlavonoidAdapter());
  Hive.registerAdapter(IngredientAdapter());
  Hive.registerAdapter(WeightPerServingAdapter());
  Hive.registerAdapter(UnitAdapter());

  await Hive.openBox<Recipe>('recipe');
  runApp(
    MultiProvider(
      providers: Providers.getAllProviders(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: RoutesName.homeView,
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: navigatorKey,
    );
  }
}
