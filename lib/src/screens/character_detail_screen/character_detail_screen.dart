import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/src/http/repositories/character_detail/models/character_episodes_item_model.dart';

import '../../http/repositories/character_detail/character_detail_repository.dart';
import '../../http/repositories/character_detail/models/character_detail_item_model.dart';
import '../splash_screen/splash_screen.dart';
import 'bloc/character_detail_bloc.dart';

class CharacterDetailScreen extends StatelessWidget {
  static const routeName = '/details';

  const CharacterDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as Arguments;

    return RepositoryProvider(
      create: (_) => CharacterDetailRepository(),
      child: BlocProvider<CharacterDetailBloc>(
        create: (BuildContext context) => CharacterDetailBloc(
          characterDetailRepository: context.read<CharacterDetailRepository>(),
        )..add(CharacterDetailScreenInitial()), //id: args.id.toString())),
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
                state.characterDetail, state.characterEpidodeList);
          }
          return const SplashScreen();
        },
      ),
    );
  }

  _buildPage(CharacterDetailItemModel characterDetail,
      List<CharacterEpisodesItemModel> characterEpidodeList) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 24.0,
              right: 16.0,
              left: 16.0,
              bottom: 24.0,
            ),
            child: Column(
              children: [
                // SizedBox(
                //   height: 300,
                //   child: ListView.builder(itemBuilder: (BuildContext context, int index) {
                //   return Column(
                //     children: [
                //       EpisodeItemCard(
                //         id: characterDetail.id,
                //         name: characterDetail.name,
                //         air_date: characterDetail.,
                //         episode: characterDetail.episode,
                //       ),
                //       const Divider(
                //         color: Color(0xFF88bc65),
                //         height: 2,
                //       ),
                //     ],
                //   );
                // },),
                // )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
