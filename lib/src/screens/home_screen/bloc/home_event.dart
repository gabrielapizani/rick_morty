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
