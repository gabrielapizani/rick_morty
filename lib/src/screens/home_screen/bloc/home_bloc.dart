import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../http/repositories/home/home_repository.dart';
import '../../../http/repositories/home/models/characters_info_model.dart';
import '../../../http/repositories/home/models/characters_item_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const HomeState()) {
    on<HomeScreenLoad>(_homeScreenLoad);
    on<OpenFilterButtonPressed>(_openFilterScreen);
    on<FilterButtonPressed>(_filterButtonPressed);
  }

  void _homeScreenLoad(
    HomeScreenLoad event,
    Emitter<HomeState> emit,
  ) async {
    await loadCharacters(
      emit,
      event.characterList,
      event.nextPage,
    );
  }

  loadCharacters(
    Emitter<HomeState> emit,
    List<CharactersItemModel>? characterList,
    String? nextPage, {
    bool isLoading = true,
  }) async {
    if (isLoading) emit(HomeLoading());

    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String>? favoritedIdList =
          prefs.getStringList('favoritedIdList');

      var nextPageNumber = nextPage?.split("?page=").last;
      var charactersResponse =
          await _homeRepository.getCharactersResponse(nextPageNumber);

      if (characterList != null && charactersResponse.results != null) {
        characterList
            .addAll(charactersResponse.results!.map((e) => e).toList());
      } else {
        characterList = charactersResponse.results ?? [];
      }

      List<CharactersItemModel>? favoritedsResults;

      if (favoritedIdList != null) {
        favoritedsResults =
            await _homeRepository.getFavoritesCharacters(favoritedIdList);
      }

      emit(HomeLoading());
      emit(HomeInitial(
        charactersList: characterList,
        pageInfos: charactersResponse.info,
        favoriteCharactersList: favoritedsResults ?? [],
      ));
    } catch (error) {
      emit(HomeInitialFailure(error: error.toString()));
    }
  }

  void _openFilterScreen(
    OpenFilterButtonPressed event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    emit(FilterScreenOpen());
  }

  void _filterButtonPressed(
    FilterButtonPressed event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    try {
      final prefs = await SharedPreferences.getInstance();

      var nextPageNumber = event.nextPage?.split("?page=").last;

      final List<String>? favoritedIdList =
          prefs.getStringList('favoritedIdList');

      List<CharactersItemModel>? favoritedsResults;

      var charactersFilterResponse = await _homeRepository.getCharactersFilter(
          event.nameCharacter, event.speciesCharacter, nextPageNumber);

      if (favoritedIdList != null) {
        favoritedsResults =
            await _homeRepository.getFavoritesCharacters(favoritedIdList);
      }
      emit(HomeInitial(
        charactersList: charactersFilterResponse.results ?? [],
        pageInfos: charactersFilterResponse.info,
        favoriteCharactersList: favoritedsResults ?? [],
      ));
    } catch (error) {
      emit(FilterError(error: error.toString()));
    }
  }
}
