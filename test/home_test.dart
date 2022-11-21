import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty/src/http/repositories/character_detail/character_detail_repository.dart';
import 'package:rick_morty/src/http/repositories/home/home_repository.dart';

void main() {
  late HomeRepository homeRepository;
  late CharacterDetailRepository characterDetailRepository;

  setUp(() {
    homeRepository = HomeRepository();
    characterDetailRepository = CharacterDetailRepository();
  });

  test('Deve retornar a próxima página ao buscar a lista de personagens',
      () async {
    const nextPage = '0';
    final result = await homeRepository.getCharactersResponse(nextPage);

    expect(
        result.info?.next, 'https://rickandmortyapi.com/api/character/?page=2');
  });

  test('Deve retornar apenas os personagens com o nome passado no parâmetro',
      () async {
    const characterName = 'Abadango Cluster Princess';
    const characterSpecies = '';
    const nextPage = '0';

    var filterCharacter = await homeRepository.getCharactersFilter(
        characterName, characterSpecies, nextPage);

    expect(filterCharacter.results, isNotNull);
    expect(filterCharacter.results!.length, 1);
    expect(filterCharacter.results!.first.name, characterName);
  });

  test('Deve retornar apenas os personagens com o nome passado no parâmetro',
      () async {
    const characterName = '';
    const characterSpecies = 'Human';
    const nextPage = '0';

    var filterCharacter = await homeRepository.getCharactersFilter(
        characterName, characterSpecies, nextPage);

    expect(filterCharacter.results, isNotNull);
    expect(filterCharacter.results!.length, greaterThanOrEqualTo(1));
    expect(filterCharacter.results!.first.species, characterSpecies);
  });

  test('Deve retornar os dados dos episódios passados como parâmetro ',
      () async {
    const episodesIds = ['3', '5', '9', '50'];

    var episodes = await characterDetailRepository.getEpisodes(episodesIds);

    expect(episodes.length, isNotNull);
    expect(episodes.length, greaterThanOrEqualTo(1));
  });
}
