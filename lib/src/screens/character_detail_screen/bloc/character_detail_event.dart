part of 'character_detail_bloc.dart';

abstract class CharacterDetailEvent extends Equatable {
  const CharacterDetailEvent();

  @override
  List<Object> get props => [];
}

class CharacterDetailScreenInitial extends CharacterDetailEvent {
  final int id;

  const CharacterDetailScreenInitial({
    required this.id,
  });
}
