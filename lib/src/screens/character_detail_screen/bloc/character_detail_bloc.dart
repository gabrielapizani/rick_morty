import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

      emit(CharacterDetailInitial(
        characterDetail: characterDetail,
        characterEpidodeDetail: episodesResults,
      ));
    } catch (error) {
      emit(CharacterDetailInitialFailure(error: error.toString()));
    }
  }
}
