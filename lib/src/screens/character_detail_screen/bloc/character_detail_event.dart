part of 'character_detail_bloc.dart';

abstract class CharacterDetailEvent {
  const CharacterDetailEvent();
}

class CharacterDetailScreenInitial extends CharacterDetailEvent {
  final String id;

  const CharacterDetailScreenInitial({
    required this.id,
  });
}

class FavoritedButtonPressed extends CharacterDetailEvent {
  final String characterId;

  const FavoritedButtonPressed({
    required this.characterId,
  });
}

class FavoritedRemoveButtonPressed extends CharacterDetailEvent {
  final String id;

  const FavoritedRemoveButtonPressed({
    required this.id,
  });
}
