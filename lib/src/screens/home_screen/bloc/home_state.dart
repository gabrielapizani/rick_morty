part of 'home_bloc.dart';

class HomeState {
  const HomeState();
}

class HomeLoading extends HomeState {}

class HomeInitial extends HomeState {
  final List<CharactersItemModel> charactersList;
  final CharactersInfoModel? pageInfos;
  final List<CharactersItemModel> favoriteCharactersList;

  const HomeInitial({
    required this.charactersList,
    required this.pageInfos,
    required this.favoriteCharactersList,
  });
}

class HomeInitialFailure extends HomeState {
  final String error;

  const HomeInitialFailure({
    required this.error,
  });
}

class FilterScreenOpen extends HomeState {}

class FilteredItem extends HomeState {
  final List<CharactersItemModel> charactersList;
  final List<CharactersItemModel> favoriteCharactersList;

  const FilteredItem({
    required this.charactersList,
    required this.favoriteCharactersList,
  });
}

class FilterError extends HomeState {
  final String error;

  const FilterError({
    required this.error,
  });
}
