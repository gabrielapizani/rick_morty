import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rick_morty/src/components/screens/sucess_screen.dart';
import 'package:rick_morty/src/http/repositories/character_detail/models/character_episodes_item_model.dart';

import '../../app.dart';
import '../../components/cards/episode_item_card.dart';
import '../../components/images/character_image.dart';
import '../../components/text/pattern_text.dart';
import '../../http/repositories/character_detail/character_detail_repository.dart';
import '../../http/repositories/character_detail/models/character_detail_item_model.dart';
import '../home_screen/front/home_screen.dart';
import '../splash_screen/splash_screen.dart';
import 'bloc/character_detail_bloc.dart';

class CharacterDetailScreen extends StatelessWidget {
  static const routeName = '/details';

  const CharacterDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;

    return RepositoryProvider(
      create: (_) => CharacterDetailRepository(),
      child: BlocProvider<CharacterDetailBloc>(
        create: (BuildContext context) => CharacterDetailBloc(
          characterDetailRepository: context.read<CharacterDetailRepository>(),
        )..add(CharacterDetailScreenInitial(id: args.id.toString())),
        child: const CharacterDetailContent(),
      ),
    );
  }
}

class CharacterDetailContent extends StatefulWidget {
  const CharacterDetailContent({
    Key? key,
  }) : super(key: key);

  @override
  _CharacterDetailContentState createState() => _CharacterDetailContentState();
}

class _CharacterDetailContentState extends State<CharacterDetailContent> {
  final ScrollController scrollController = ScrollController();
  bool? hasReachedMax;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141645),
      body: BlocConsumer<CharacterDetailBloc, CharacterDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CharacterDetailInitial) {
            return _buildPage(
              state.characterDetail,
              state.characterEpidodeList,
              state.isFavorited,
            );
          }
          if (state is FavoriteSaveSuccess) {
            return _favoritedSucess();
          }
          return const SplashScreen();
        },
      ),
    );
  }

  _buildPage(
    CharacterDetailItemModel characterDetail,
    List<CharacterEpisodesItemModel> characterEpidodeList,
    bool isFavorited,
  ) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
                right: 16.0,
                left: 16.0,
                bottom: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () async {
                      Navigator.pushNamed(
                        context,
                        HomeScreen.routeName,
                      );
                    },
                    icon: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Color(
                        0xFF02b1c6,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 220,
                            height: 220,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(
                                  0xFF02b1c6,
                                ),
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: CharacterImage(
                              image: characterDetail.image,
                              width: 200.0,
                              height: 200.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 24.0,
                            ),
                            child: Row(
                              children: [
                                PatternText(
                                  text: characterDetail.name,
                                  fontSize: 24.0,
                                  color: const Color(
                                    0xFF02b1c6,
                                  ),
                                  fontWeight: FontWeight.w600,
                                ),
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      isFavorited = !isFavorited;
                                    });

                                    context.read<CharacterDetailBloc>().add(
                                          FavoritedButtonPressed(
                                              characterId: characterDetail.id
                                                  .toString()),
                                        );
                                  },
                                  icon: Icon(
                                    isFavorited
                                        ? FontAwesomeIcons.heartCircleCheck
                                        : FontAwesomeIcons.heart,
                                    color: const Color(0xFF02b1c6),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const PatternText(
                          text: 'Status:',
                          fontSize: 20.0,
                          color: Color(
                            0xFF02b1c6,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: PatternText(
                            text: characterDetail.status,
                            fontSize: 20.0,
                            color: const Color(
                              0xFFf4ea39,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const PatternText(
                          text: 'Species:',
                          fontSize: 20.0,
                          color: Color(
                            0xFF02b1c6,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: PatternText(
                            text: characterDetail.species,
                            fontSize: 20.0,
                            color: const Color(
                              0xFFf4ea39,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const PatternText(
                          text: 'Gender:',
                          fontSize: 20.0,
                          color: Color(
                            0xFF02b1c6,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: PatternText(
                            text: characterDetail.gender,
                            fontSize: 20.0,
                            color: const Color(
                              0xFFf4ea39,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const PatternText(
                          text: 'Origin:',
                          fontSize: 20.0,
                          color: Color(
                            0xFF02b1c6,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: PatternText(
                            text: characterDetail.origin.name,
                            fontSize: 20.0,
                            color: const Color(
                              0xFFf4ea39,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const PatternText(
                          text: 'Location:',
                          fontSize: 20.0,
                          color: Color(
                            0xFF02b1c6,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: PatternText(
                              text: characterDetail.location.name,
                              fontSize: 20.0,
                              color: const Color(
                                0xFFf4ea39,
                              )),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: PatternText(
                      text: 'Episodes:',
                      fontSize: 20.0,
                      color: Color(
                        0xFF02b1c6,
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: characterEpidodeList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              EpisodeItemCard(
                                name: characterEpidodeList[index].name,
                                air_date: characterEpidodeList[index].airDate,
                                episode: characterEpidodeList[index].episode,
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
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _favoritedSucess() {
    return SuccessScreen(
        text: 'Character save with sucess!',
        onTap: () {
          Navigator.pushNamed(context, HomeScreen.routeName);
        });
  }
}
