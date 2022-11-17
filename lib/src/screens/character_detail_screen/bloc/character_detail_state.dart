part of 'character_detail_bloc.dart';

class CharacterDetailState extends Equatable {
  const CharacterDetailState();

  @override
  List<Object> get props => [];
}

class CharacterDetailLoading extends CharacterDetailState {}

class CharacterDetailInitial extends CharacterDetailState {
  final CharacterDetailItemModel characterDetail;
  final List<CharacterEpisodesItemModel> characterEpidodeDetail;

  const CharacterDetailInitial({
    required this.characterDetail,
    required this.characterEpidodeDetail,
  });
}

class CharacterDetailInitialFailure extends CharacterDetailState {
  final String error;

  const CharacterDetailInitialFailure({
    required this.error,
  });
}
