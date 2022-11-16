import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/cards/item_card.dart';
import '../../../components/images/logo_image.dart';
import '../../../http/repositories/home/home_repository.dart';
import '../../../http/repositories/home/models/characters_item_model.dart';
import '../../../http/repositories/home/models/favorite_characters_item_model.dart';
import '../../splash_screen/splash_screen.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(
        homeRepository: RepositoryProvider.of<HomeRepository>(context),
      )..add(HomeScreenInitial()),
      child: const HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent>
    with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  bool? hasReachedMax;

  @override
  void initState() {
    super.initState();

    // scrollController.addListener(() {
    //   if (scrollController.position.maxScrollExtent ==
    //           scrollController.offset &&
    //       hasReachedMax == false) {
    //     fetch();
    //   }
    // });
  }

  // Future fetch() async {
  //   context.read<HomeBloc>().add(HomeScreenInitial());
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141645),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeInitial) {
            return _buildPage(
              state.charactersList,
              state.favoriteCharactersList,
            );
          }
          return const SplashScreen();
        },
      ),
    );
  }

  _buildPage(
    List<CharactersItemModel> charactersList,
    List<FavoriteCharactersItemModel> favoriteCharactersList,
  ) {
    TabController _tabController;
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
                right: 16.0,
                left: 16.0,
                bottom: 24.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      LogoImage(),
                    ],
                  ),
                  TabBar(
                      controller: _tabController,
                      labelColor: Colors.white,
                      indicatorWeight: 3,
                      indicatorColor: Color(0xFF88bc65),
                      labelStyle: const TextStyle(
                        fontSize: 16.0,
                      ),
                      tabs: const <Widget>[
                        Tab(
                          text: "Todos",
                        ),
                        Tab(
                          text: "Favoritos",
                        ),
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                    ),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          controller: scrollController,
                          itemCount: charactersList.length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                ItemCard(
                                  id: charactersList[index].id,
                                  image: charactersList[index].image,
                                  name: charactersList[index].name,
                                  species: charactersList[index].species,
                                  episodes:
                                      charactersList[index].totalEpisodes ?? 0,
                                  isFavorited:
                                      charactersList[index].isFavorited ??
                                          false,
                                  onTapFunction: () {},
                                ),
                                const Divider(
                                  color: Color(0xFF88bc65),
                                  height: 1,
                                ),
                              ],
                            );
                          },
                        ),
                        ListView.builder(
                          controller: scrollController,
                          itemCount: charactersList.length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                ItemCard(
                                  id: charactersList[index].id,
                                  image: charactersList[index].image,
                                  name: charactersList[index].name,
                                  species: charactersList[index].species,
                                  episodes:
                                      charactersList[index].totalEpisodes ?? 0,
                                  isFavorited:
                                      charactersList[index].isFavorited ??
                                          false,
                                  onTapFunction: () {},
                                ),
                                const Divider(
                                  color: Color(0xFF88bc65),
                                  height: 1,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
