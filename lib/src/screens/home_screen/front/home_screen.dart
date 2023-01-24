import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rick_morty/src/components/screens/error_screen.dart';
import 'package:rick_morty/src/components/text/filter_text.dart';
import 'package:rick_morty/src/screens/splash_screen/splash_screen.dart';

import '../../../app.dart';
import '../../../components/buttons/default_button.dart';
import '../../../components/cards/item_card.dart';
import '../../../components/images/logo_image.dart';
import '../../../components/text/pattern_text.dart';
import '../../../http/repositories/home/home_repository.dart';
import '../../../http/repositories/home/models/characters_item_model.dart';
import '../../character_detail_screen/character_detail_screen.dart';
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
      )..add(const HomeScreenLoad()),
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
  String? nextPage;
  List<CharactersItemModel>? characterList;
  bool isLoading = false;
  late TabController _tabController;
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Todos'),
    Tab(text: 'Favoritos'),
  ];

  final _textfieldControllerName = TextEditingController();
  final _textfieldControllerSpecies = TextEditingController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.offset &&
          hasReachedMax == false) {
        fetch();
      }
    });

    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(fetch)
      ..dispose();

    characterList = List.empty();

    super.dispose();
  }

  Future fetch() async {
    context.read<HomeBloc>().add(HomeScreenLoad(
          characterList: characterList,
          nextPage: nextPage,
          isLoading: isLoading,
        ));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141645),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeInitial) {
            nextPage = state.pageInfos?.next;
            hasReachedMax = state.pageInfos?.next == null;
            characterList = state.charactersList;
            setState(() {});
          }
        },
        builder: (context, state) {
          if (state is HomeInitial) {
            return _buildPage(
              state.charactersList,
              state.favoriteCharactersList,
            );
          } else if (state is FilterScreenOpen) {
            return _filterScreen();
          } else if (state is HomeInitialFailure) {
            return _errorHomeInitialScreen();
          } else if (state is FilterError) {
            return _errorFilterScreen();
          }

          return const SplashScreen();
        },
      ),
    );
  }

  _buildPage(
    List<CharactersItemModel> charactersList,
    List<CharactersItemModel> favoriteCharactersList,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24.0,
        right: 10.0,
        left: 10.0,
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
            tabs: tabs,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const PatternText(
                          text: 'Filtrar',
                          color: Color(
                            0xFF02b1c6,
                          ),
                          fontSize: 18.0,
                        ),
                        IconButton(
                          iconSize: 20,
                          color: const Color(
                            0xFF02b1c6,
                          ),
                          onPressed: () {
                            context.read<HomeBloc>().add(
                                  OpenFilterButtonPressed(),
                                );
                          },
                          icon: const Icon(FontAwesomeIcons.filter),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 570,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        controller: scrollController,
                        itemCount: charactersList.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < charactersList.length) {
                            return Column(
                              children: [
                                ItemCard(
                                  id: charactersList[index].id,
                                  image: charactersList[index].image,
                                  name: charactersList[index].name,
                                  species: charactersList[index].species,
                                  episodes:
                                      charactersList[index].totalEpisodes =
                                          charactersList[index].episode.length,
                                  isFavorited:
                                      charactersList[index].isFavorited ??
                                          false,
                                  onTapFunction: () {
                                    charactersList[index].id;
                                    Navigator.pushNamed(
                                      context,
                                      CharacterDetailScreen.routeName,
                                      arguments: Arguments(
                                          id: charactersList[index].id),
                                    );
                                  },
                                ),
                                const Divider(
                                  color: Color(0xFF88bc65),
                                  height: 2,
                                ),
                              ],
                            );
                          } else {
                            return const PatternText(
                              text: "Você não possui mais itens para carregar",
                              color: Colors.white,
                              fontSize: 18,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 620,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: favoriteCharactersList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              ItemCard(
                                id: favoriteCharactersList[index].id,
                                image: favoriteCharactersList[index].image,
                                name: favoriteCharactersList[index].name,
                                species: favoriteCharactersList[index].species,
                                episodes: favoriteCharactersList[index]
                                        .totalEpisodes =
                                    favoriteCharactersList[index]
                                        .episode
                                        .length,
                                isFavorited:
                                    favoriteCharactersList[index].isFavorited ??
                                        false,
                                onTapFunction: () {
                                  favoriteCharactersList[index].id;
                                  Navigator.pushNamed(
                                    context,
                                    CharacterDetailScreen.routeName,
                                    arguments: Arguments(
                                        id: favoriteCharactersList[index].id),
                                  );
                                },
                              ),
                              const Divider(
                                color: Color(0xFF88bc65),
                                height: 2,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _filterScreen() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 56.0,
        right: 10.0,
        left: 10.0,
        bottom: 24.0,
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const PatternText(
                    text: 'Por favor preencha um ou mais campos para filtrar:',
                    color: Color(
                      0xFF02b1c6,
                    ),
                    fontSize: 24.0),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: FilterText(
                    text: 'Nome',
                    controller: _textfieldControllerName,
                  ),
                ),
                FilterText(
                  text: 'Espécie',
                  controller: _textfieldControllerSpecies,
                ),
              ],
            ),
          ),
          DefaultButton(
            text: 'Filtrar',
            onPressed: () {
              context.read<HomeBloc>().add(
                    FilterButtonPressed(
                      nameCharacter: _textfieldControllerName.text,
                      speciesCharacter: _textfieldControllerSpecies.text,
                    ),
                  );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: DefaultButton(
              text: 'Voltar',
              onPressed: () {
                context.read<HomeBloc>().add(
                      const HomeScreenLoad(),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }

  _errorHomeInitialScreen() {
    return ErrorScreen(
      text:
          'Não foi possível iniciar o aplicativo, tente novamente mais tarde.',
      onTap: () async {
        Navigator.pushNamed(
          context,
          HomeScreen.routeName,
        );
      },
    );
  }

  _errorFilterScreen() {
    return ErrorScreen(
      text:
          'Não foi possível concluir sua busca, por favor verifique os campos digitados e tente novamente.',
      onTap: () async {
        Navigator.pushNamed(
          context,
          HomeScreen.routeName,
        );
      },
    );
  }
}
