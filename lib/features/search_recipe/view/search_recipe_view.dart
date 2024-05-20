import 'package:receipe/features/search_recipe/view_model/search_recipe_view_model.dart';
import 'package:receipe/widgets/error_view.dart';
import 'package:receipe/widgets/loading_view.dart';

import '/core.dart';
import '../model/search_recipe_by_ingredient_model.dart';

class SearchRecipeView extends StatefulWidget {
  const SearchRecipeView({super.key});

  @override
  _SearchRecipeViewState createState() => _SearchRecipeViewState();
}

class _SearchRecipeViewState extends State<SearchRecipeView> {
  @override
  void initState() {
    super.initState();

    final provider = Provider.of<SearchRecipeViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // provider.fetchRecipes();
      provider.fetchRecipesByIngredients();
    });
  }

  @override
  void deactivate() {
    final viewModel =
        Provider.of<SearchRecipeViewModel>(context, listen: false);
    viewModel.searchController.text = "";
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final SearchRecipeViewModel viewModel =
        Provider.of<SearchRecipeViewModel>(context);

    // return searchBody(viewModel);
    switch (viewModel.searchRecipesByIngredients.status) {
      case Status.loading:
        return LoadingView();
      case Status.error:
        return ErrorView(
          onTap: () async {
            await viewModel.fetchRecipesByIngredients();
          },
          errorMessage: viewModel.searchRecipesByIngredients.message.toString(),
        );
      case Status.completed:
        return buildHomeView(viewModel.searchRecipesByIngredients.data!);
      default:
        return const Text('No Data');
    }
  }

  Widget buildHomeView(List<SearchRecipesByIngredientModel> recipeList) {
    final SearchRecipeViewModel viewModel =
        Provider.of<SearchRecipeViewModel>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              titlePadding: EdgeInsets.all(10),
              collapseMode: CollapseMode.parallax,
              centerTitle: true,
              title: AppTextField(
                controller: viewModel.searchController,
                hintText: "Search by ingredients...",
                onEditingComplete: () => viewModel.fetchRecipesByIngredients(
                    searchQuery: viewModel.searchController.text),
              ),
              background: Image.network(
                'https://www.campdenbri.co.uk/images/fruit-veg-seeds-medium.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // title: AppTextField(),
          ),
          SliverToBoxAdapter(
            child: viewModel.searchController.text.trim().isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Search results : ${recipeList.length}'),
                  )
                : SizedBox.shrink(),
          ),
          SliverToBoxAdapter(
            child: Visibility(
              visible: viewModel.searchController.text.trim().isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Recipes by ingredients',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          recipeList.isEmpty
              ? SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Center(
                      child: Visibility(
                        visible: viewModel.searchController.text.trim().isEmpty,
                        replacement: Text('Recipe Not Found'),
                        child: Text('Lets search a recipe ...!'),
                      ),
                    ),
                  ),
                )
              : SliverPadding(
                  padding: EdgeInsets.all(10.0),
                  sliver: SliverAlignedGrid.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemBuilder: (BuildContext context, int index) {
                      var item = recipeList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              RoutesName.recipeDetailView,
                              arguments: item.id);
                        },
                        child: Card(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  // height: 80,
                                  width: double.infinity,
                                  // padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  alignment: Alignment.center,
                                  child: ListTile(
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(item.image!),
                                        ),
                                      ),
                                      title: Text(
                                        item.title!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      subtitle: Text.rich(TextSpan(
                                        children:
                                            item.usedIngredients?.map((item) {
                                          return TextSpan(
                                            text: "${item.aisle} ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                            ),
                                          );
                                        }).toList(),
                                      ))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: recipeList.length,
                  ),
                ),
        ],
      ),
    );
  }
}
