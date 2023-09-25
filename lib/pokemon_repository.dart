import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_page_response.dart';

class PokemonRepository {
  final basseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    //  pokemon?limit=151&offset=0

    final queryParameters = {
      'limit': '151',
      'offset': (pageIndex * 151).toString()
    };

    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParameters);

    final response = await client.get(uri);
    final json = jsonDecode (response.body);

    return PokemonPageResponse.fromJson(json);
  }
}