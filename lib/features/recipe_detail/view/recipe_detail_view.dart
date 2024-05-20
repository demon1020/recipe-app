import 'package:receipe/features/home/model/recipe_model.dart';
import 'package:receipe/features/recipe_detail/view_model/recipe_detail_view_model.dart';

import '../../../core.dart';
import '../../../widgets/error_view.dart';
import '../../../widgets/loading_view.dart';

class RecipeDetailView extends StatefulWidget {
  final int id;

  const RecipeDetailView({super.key, required this.id});

  @override
  State<RecipeDetailView> createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends State<RecipeDetailView> {
  @override
  void initState() {
    super.initState();

    final provider = Provider.of<RecipeDetailViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.init(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final RecipeDetailViewModel viewModel =
        Provider.of<RecipeDetailViewModel>(context);
    switch (viewModel.recipe.status) {
      case Status.loading:
        return LoadingView();
      case Status.error:
        return ErrorView(
          onTap: () async {
            await viewModel.fetchRecipes(widget.id);
          },
          errorMessage: viewModel.recipe.message.toString(),
        );
      case Status.completed:
        return buildBody(viewModel.recipe.data!, context);

      default:
        return const Text('No Data');
    }
  }

  Scaffold buildBody(Recipe recipe, BuildContext context) {
    final RecipeDetailViewModel viewModel =
        Provider.of<RecipeDetailViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title!),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(recipe.image!),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          var recipe = viewModel.favouriteRecipeList
                              .where((e) => e.id == widget.id)
                              .toList();
                          if (recipe.isEmpty) {
                            viewModel.recipe.data!.isFavourite = true;
                            viewModel.addRecipe(viewModel.recipe.data!);
                          } else {
                            recipe.first.isFavourite = false;
                            viewModel.deleteRecipeById(widget.id);
                          }
                        },
                        icon: Icon(
                          viewModel.favouriteRecipeList
                                  .any((e) => e.id == widget.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 30,
                          weight: 100,
                          color: viewModel.favouriteRecipeList
                                  .any((e) => e.id == widget.id)
                              ? AppColor.red
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  recipe.title!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              _buildSectionTitle('Ingredients'),
              _buildIngredients(recipe.nutrition!.ingredients!),
              _buildSectionTitle('Instructions'),
              _buildInstructions(recipe.analyzedInstructions!),
              _buildSectionTitle('Nutritional Information'),
              _buildNutritionInfo(recipe.nutrition!.nutrients),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInstructions(List<AnalyzedInstruction> analyzedInstruction) {
    return Column(
        children: analyzedInstruction.map<Widget>((section) {
      return Column(
        children: section.steps!.map<Widget>((item) {
          return ListTile(
            title: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${item.number!}. ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: item.step!),
                ],
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  "Ingredients",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: item.ingredients!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 150,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(
                                        item.ingredients![index].image!),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    fit: BoxFit.cover,
                                    item.ingredients![index].image!,
                                  ),
                                ),
                              ),
                              Text(
                                item.ingredients![index].name!.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        }).toList(),
      );
    }).toList());
  }

  Widget _buildIngredients(List<Ingredient> ingredientList) {
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: ingredientList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = ingredientList[index];
            return Container(
              width: 200,
              child: Card(
                // margin: EdgeInsets.all(10),
                color: Colors.primaries[index % 10].withOpacity(0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      item.name!.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: AppColor.white,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: item.amount.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: AppColor.white,
                            ),
                          ),
                          TextSpan(
                            text: " ${item.unit}",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _buildNutritionInfo(List<Flavonoid>? nutrientList) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Table(
        border: TableBorder.all(),
        columnWidths: {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(1),
        },
        children: [
          TableRow(
            children: [
              TableCell(
                child: Container(
                  color: Colors.grey[300],
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  color: Colors.grey[300],
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Amount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  color: Colors.grey[300],
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Unit',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  color: Colors.grey[300],
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '% of Daily Needs',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          ...nutrientList!.map((nutrition) {
            return TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(nutrition.name ?? ''),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(nutrition.amount?.toString() ?? ''),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(unitMap[nutrition.unit!]!),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        Text(nutrition.percentOfDailyNeeds?.toString() ?? ''),
                  ),
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
