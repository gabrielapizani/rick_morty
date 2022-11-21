import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../http/repositories/character_detail/character_detail_repository.dart';
import '../../../http/repositories/character_detail/models/character_detail_item_model.dart';
import '../../../http/repositories/character_detail/models/character_episodes_item_model.dart';

part 'character_detail_event.dart';
part 'character_detail_state.dart';

class CharacterDetailBloc
    extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  final CharacterDetailRepository _characterDetailRepository;

  CharacterDetailBloc(
      {required CharacterDetailRepository characterDetailRepository})
      : _characterDetailRepository = characterDetailRepository,
        super(const CharacterDetailState()) {
    on<CharacterDetailScreenInitial>(_characterDetailScreenInitial);
    on<FavoritedButtonPressed>(_favoritedButtonPressed);
  }

  void _characterDetailScreenInitial(
    CharacterDetailScreenInitial event,
    Emitter<CharacterDetailState> emit,
  ) async {
    emit(CharacterDetailLoading());

    try {
      var characterDetail =
          await _characterDetailRepository.getCharactersResponse(event.id);

      var episodeIds = characterDetail.episode
          .map((episode) => episode.split('/').last)
          .toList();

      var episodesResults =
          await _characterDetailRepository.getEpisodes(episodeIds);

      final prefs = await SharedPreferences.getInstance();

      final List<String>? favoritedIdList =
          prefs.getStringList('favoritedIdList');

      final bool isFavorited =
          favoritedIdList != null && favoritedIdList.contains(event.id);

      emit(CharacterDetailInitial(
        characterDetail: characterDetail,
        characterEpidodeList: episodesResults,
        isFavorited: isFavorited,
      ));
    } catch (error) {
      emit(CharacterDetailInitialFailure(error: error.toString()));
    }
  }

  void _favoritedButtonPressed(
    FavoritedButtonPressed event,
    Emitter<CharacterDetailState> emit,
  ) async {
    emit(CharacterDetailLoading());

    try {
      final prefs = await SharedPreferences.getInstance();

      final List<String>? favoritedIdList =
          prefs.getStringList('favoritedIdList');

      if (favoritedIdList == null) {
        await prefs
            .setStringList('favoritedIdList', <String>[event.characterId]);
      } else {
        if (favoritedIdList.contains(event.characterId)) {
          favoritedIdList.remove(event.characterId);
        } else {
          favoritedIdList.add(event.characterId);
        }

        await prefs.setStringList('favoritedIdList', favoritedIdList);
      }

      emit(FavoriteSaveSuccess());
    } catch (error) {
      emit(CharacterDetailInitialFailure(error: error.toString()));
    }
  }
}
