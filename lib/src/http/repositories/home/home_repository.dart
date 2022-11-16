import '../../api_client/api_client.dart';
import 'models/characters_info_model.dart';
import 'models/characters_item_model.dart';
import 'models/characters_response_model.dart';
import 'models/episode_item_model.dart';
import 'models/favorite_characters_item_model.dart';
import 'models/location_item_model.dart';

class HomeRepository {
  final ApiClient _client;

  HomeRepository({ApiClient? client}) : _client = client ?? ApiClient();

  Future<CharactersResponseModel> getCharactersResponse() async {
    try {
      const String _endpoint = '/character';
      var response = await _client.get(
        _endpoint,
      );
      var responseModel = CharactersResponseModel();

      if (response != null &&
          response["info"] != null &&
          response["results"] != null) {
        List<CharactersItemModel> resultList = (response["results"] as List)
            .map((i) => CharactersItemModel.fromJson(i))
            .toList();

        responseModel = CharactersResponseModel(
          info: CharactersInfoModel.fromJson(response["info"]),
          results: resultList,
        );
      }

      return responseModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<EpisodeItemModel>> getEpisodes() async {
    try {
      const String _endpoint = '/character';
      var response = await _client.get(
        _endpoint,
      );

      List<EpisodeItemModel> returnList =
          (response as List).map((i) => EpisodeItemModel.fromJson(i)).toList();

      return returnList;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LocationItemModel>> getLocation() async {
    try {
      const String _endpoint = '/character';
      var response = await _client.get(
        _endpoint,
      );

      List<LocationItemModel> returnList =
          (response as List).map((i) => LocationItemModel.fromJson(i)).toList();

      return returnList;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FavoriteCharactersItemModel>> getFavoritesCharacters() async {
    return [];
    // try {
    //   const String _endpoint = '/character';
    //   var response = await _client.get(
    //     _endpoint,
    //   );

    //   List<FavoriteCharactersItemModel> returnList = (response as List)
    //       .map((i) => FavoriteCharactersItemModel.fromJson(i))
    //       .toList();

    //   return returnList;
    // } catch (e) {
    //   rethrow;
    // }
  }
}
