import '../../api_client/api_client.dart';
import 'models/characters_info_model.dart';
import 'models/characters_item_model.dart';
import 'models/characters_response_model.dart';

class HomeRepository {
  final ApiClient _client;

  HomeRepository({ApiClient? client}) : _client = client ?? ApiClient();

  Future<CharactersResponseModel> getCharactersResponse(
    String? nextPage,
  ) async {
    try {
      String endpoint = '/character';
      if (nextPage != null) {
        endpoint = '$endpoint/?page=$nextPage';
      }
      var response = await _client.get(
        endpoint,
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

  Future<List<CharactersItemModel>> getFavoritesCharacters(
      List<String> favoritedIds) async {
    try {
      var joinedFavoritedCharactersIds = favoritedIds.join(',');
      String endpoint =
          '/character/${joinedFavoritedCharactersIds.replaceAll(r',', '%2C')}';
      var response = await _client.get(
        endpoint,
      );

      List<CharactersItemModel> returnList;

      if (response is List) {
        returnList =
            response.map((i) => CharactersItemModel.fromJson(i)).toList();
      } else {
        returnList = [CharactersItemModel.fromJson(response)];
      }

      return returnList;
    } catch (e) {
      rethrow;
    }
  }

  Future<CharactersResponseModel> getCharactersFilter(
    String? filterName,
    String? filterSpecies,
    String? nextPage,
  ) async {
    try {
      String endpoint =
          '/character/?name=$filterName&status=&species=$filterSpecies&type=&gender=';

      var response = await _client.get(
        endpoint,
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
}
