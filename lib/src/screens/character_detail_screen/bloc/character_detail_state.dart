part of 'character_detail_bloc.dart';

class CharacterDetailState extends Equatable {
  const CharacterDetailState();

  @override
  List<Object> get props => [];
}

class CharacterDetailLoading extends CharacterDetailState {}

class CharacterDetailInitial extends CharacterDetailState {
  final CharacterDetailItemModel characterDetail;
  final List<CharacterEpisodesItemModel> characterEpidodeList;
  final bool isFavorited;

  const CharacterDetailInitial({
    required this.characterDetail,
    required this.characterEpidodeList,
    required this.isFavorited,
  });
}

class CharacterDetailInitialFailure extends CharacterDetailState {
  final String error;

  const CharacterDetailInitialFailure({
    required this.error,
  });
}

class FavoriteSaveSuccess extends CharacterDetailState {}

class FavoriteSRemoveSuccess extends CharacterDetailState {}
