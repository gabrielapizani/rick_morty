part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
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
