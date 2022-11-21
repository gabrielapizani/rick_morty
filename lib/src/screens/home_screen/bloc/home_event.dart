part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenLoad extends HomeEvent {
  final List<CharactersItemModel>? characterList;
  final String? nextPage;
  final bool isLoading;

  const HomeScreenLoad({
    this.characterList,
    this.nextPage,
    this.isLoading = true,
  });
}

class OpenFilterButtonPressed extends HomeEvent {}

class FilterButtonPressed extends HomeEvent {
  final String? nameCharacter;
  final String? speciesCharacter;
  final String? nextPage;

  const FilterButtonPressed({
    this.nameCharacter,
    this.speciesCharacter,
    this.nextPage,
  });
}
