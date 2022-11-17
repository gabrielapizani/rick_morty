import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../http/repositories/home/home_repository.dart';
import '../../../http/repositories/home/models/characters_item_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const HomeState()) {
    on<HomeScreenInitial>(_homeScreenInitial);
  }

  void _homeScreenInitial(
    HomeScreenInitial event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    try {
      var charactersResults = await _homeRepository.getCharactersResponse();
      // var favoritedsResults = await _homeRepository.getFavoritesCharacters();

      emit(HomeInitial(
        charactersList: charactersResults.results ?? [],
        // pageInfos: charactersResults.info!,
        // favoriteCharactersList: favoritedsResults,
      ));
    } catch (error) {
      emit(HomeInitialFailure(error: error.toString()));
    }
  }
}
