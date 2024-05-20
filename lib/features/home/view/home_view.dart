import 'package:receipe/features/home/view_model/home_view_model.dart';
import 'package:receipe/widgets/error_view.dart';
import 'package:receipe/widgets/loading_view.dart';

import '/core.dart';
import '../../../data/services/app_hive.dart';
import '../model/recipe_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    final provider = Provider.of<HomeViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.appHive = AppHive();
      provider.init();
    });
  }

  @override
  void deactivate() {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    viewModel.searchController.text = "";
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = Provider.of<HomeViewModel>(context);

    switch (viewModel.randomRecipe.status) {
      case Status.loading:
        return LoadingView();
      case Status.error:
        return ErrorView(
          onTap: () async {
            await viewModel.fetchRandomRecipes();
          },
          errorMessage: viewModel.randomRecipe.message.toString(),
        );
      case Status.completed:
        return buildHomeView(viewModel.randomRecipe.data!.recipes!);

      default:
        return const Text('No Data');
    }
  }

  Widget buildHomeView(List<Recipe> recipeList) {
    final HomeViewModel viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 270.0,
            pinned: false,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              titlePadding: EdgeInsets.all(10),
              collapseMode: CollapseMode.parallax,
              centerTitle: true,
              title: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppTextField(
                      controller: viewModel.searchController,
                      hintText: "Search recipe by name...",
                      onEditingComplete: () => viewModel.fetchRecipes(
                          searchQuery: viewModel.searchController.text),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Divider(),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'OR',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Divider(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: AppButton(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.searchRecipeView);
                        },
                        text: "Search by Ingredients",
                      ),
                    )
                  ],
                ),
              ),
              background: Container(
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                color: Colors.grey.shade200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Hello, Foodie!\n",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColor.lightGrey,
                            ),
                          ),
                          TextSpan(
                            text: 'Make your own food\nStay at ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                          ),
                          TextSpan(
                            text: 'home.',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: AppColor.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // title: AppTextField(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: viewModel.dietList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var item = viewModel.dietList[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ChoiceChip(
                      // avatar: Icon(Icons.add),
                      label: Text(
                        item.name!,
                        style: TextStyle(color: Colors.black),
                      ),
                      onSelected: (value) {
                        viewModel.updateChip(index);
                      },
                      selected: item.isSelected,
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: viewModel.dietList.any((_element) => _element.isSelected) ||
                    viewModel.searchController.text.trim().isNotEmpty
                ? SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Today's special",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
          ),
          SliverToBoxAdapter(
            child: viewModel.dietList.any((_element) => _element.isSelected) ||
                    viewModel.searchController.text.trim().isNotEmpty
                ? SizedBox.shrink()
                : SizedBox(
                    height: 270,
                    child: ListView.builder(
                      itemCount: viewModel.randomRecipe.data!.recipes!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var item = viewModel.randomRecipe.data!.recipes![index];
                        return GestureDetector(
                          onTap: () async {
                            await Navigator.of(context).pushNamed(
                              RoutesName.recipeDetailView,
                              arguments: item.id,
                            );
                            await viewModel.getAllRecipes();
                            setState(() {});
                          },
                          child: Container(
                            width: 200,
                            padding: EdgeInsets.only(left: 10),
                            child: Card(
                              child: Container(
                                alignment: Alignment.topCenter,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Image(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                        image: NetworkImage(item.image ??
                                            "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          item.title!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Delicious Recipes",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          buildDeliciousRecipe(),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 60,
        width: 150,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(RoutesName.favouriteRecipeView);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View',
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.favorite),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildRenderObjectWidget buildDeliciousRecipe() {
    final HomeViewModel viewModel = Provider.of<HomeViewModel>(context);

    switch (viewModel.searchRecipes.status) {
      case Status.loading:
        return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()));
      case Status.error:
        return SliverToBoxAdapter(
          child: ErrorView(
            onTap: () async {
              await viewModel.fetchRecipes();
            },
            errorMessage: viewModel.searchRecipes.message.toString(),
          ),
        );
      case Status.completed:
        List<Recipe> recipeList = viewModel.searchRecipes.data!.recipeList!;
        return recipeList.isEmpty
            ? SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Center(
                    child: Text('Recipe Not Found'),
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
                    Recipe item = recipeList[index];
                    return buildRecipeCard(context, item, index);
                  },
                  itemCount: recipeList.length,
                ),
              );

      default:
        return SliverToBoxAdapter(child: const Text('No Data'));
    }
  }
}

InkWell buildRecipeCard(BuildContext context, Recipe item, int index) {
  final HomeViewModel viewModel = Provider.of<HomeViewModel>(context);

  return InkWell(
    onTap: () {
      Navigator.of(context)
          .pushNamed(RoutesName.recipeDetailView, arguments: item.id);
    },
    child: Card(
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      image: NetworkImage(item.image ??
                          "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),
                    ),
                  ),
                ),
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
                            .where((e) => e.id == item.id)
                            .toList();
                        if (recipe.isEmpty) {
                          item.isFavourite = true;
                          viewModel.addRecipe(item);
                        } else {
                          item.isFavourite = false;
                          recipe.first.isFavourite = false;
                          viewModel.deleteRecipeByIndex(item.id!);
                        }
                      },
                      icon: Icon(
                        viewModel.favouriteRecipeList
                                    .any((e) => e.id == item.id) &&
                                item.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 30,
                        weight: 100,
                        color: viewModel.favouriteRecipeList
                                    .any((e) => e.id == item.id) &&
                                item.isFavourite
                            ? AppColor.red
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 80,
              width: double.infinity,
              // padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Flexible(
                    child: ListTile(
                      title: Text(
                        item.title!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        "Ready in ${item.readyInMinutes} mins | serving : ${item.servings}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                      trailing: Text(
                        "₹${item.pricePerServing}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
