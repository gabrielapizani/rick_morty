import '../../api_client/api_client.dart';
import 'models/character_detail_item_model.dart';
import 'models/character_episodes_item_model.dart';
import 'models/character_location_item_model.dart';

class CharacterDetailRepository {
  final ApiClient _client;

  CharacterDetailRepository({ApiClient? client})
      : _client = client ?? ApiClient();

  Future<CharacterDetailItemModel> getCharactersResponse() async {
    try {
      String _endpoint = '/character/'; //$id';
      var response = await _client.get(
        _endpoint,
      );

      CharacterDetailItemModel responseModel =
          CharacterDetailItemModel.fromJson(response);

      return responseModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CharacterEpisodesItemModel>> getEpisodes(
      List<String> episodeIds) async {
    try {
      var joinedEpisodeIds = episodeIds.join(',');
      String _endpoint = '/episode/${joinedEpisodeIds.replaceAll(r',', '%2C')}';
      var response = await _client.get(
        _endpoint,
      );

      List<CharacterEpisodesItemModel> returnList = (response as List)
          .map((i) => CharacterEpisodesItemModel.fromJson(i))
          .toList();

      return returnList;
    } catch (e) {
      rethrow;
    }
  }

  Future<CharacterLocationItemModel> getLocation(List<int> id) async {
    try {
      String _endpoint = '/episode/$id';
      var response = await _client.get(
        _endpoint,
      );

      CharacterLocationItemModel returnModel =
          CharacterLocationItemModel.fromJson(response);

      return returnModel;
    } catch (e) {
      rethrow;
    }
  }

  // Future <FavoriteCharactersItemModel> getFavoritesCharacters() async {
  //   try {
  //     const String _endpoint = '/character';
  //     var response = await _client.get(
  //       _endpoint,
  //     );

  //     List<FavoriteCharactersItemModel> returnList = (response as List)
  //         .map((i) => FavoriteCharactersItemModel.fromJson(i))
  //         .toList();

  //     return returnList;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
