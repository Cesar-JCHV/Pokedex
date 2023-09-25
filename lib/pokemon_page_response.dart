import 'dart:ui';

import 'package:flutter/foundation.dart';

/*
count:1292
next:"https://pokeapi.co/api/v2/pokemon?offset=151&limit=151"
previous:null
name:"bulbasaur"
url:"https://pokeapi.co/api/v2/pokemon/1/"
name:"ivysaur"
url:"https://pokeapi.co/api/v2/pokemon/2/"
 */

class PokemonListing {
  final int id;
  final String name;

  String get imageUrl => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

  PokemonListing({@required this.id, @required this.name});

  factory PokemonListing.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return PokemonListing(id: id, name: name);
  }
}

class PokemonPageResponse{
  final List<PokemonListing> pokemonListing;
  final bool canLoadNextPage;

  PokemonPageResponse({@required this.pokemonListing, @required this.canLoadNextPage});

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final PokemonListing = (json['results'] as List)
      .map((listingJson) => PokemonListing.fromJson(listingJson))
      .toList();

    return PokemonPageResponse(pokemonListing: pokemonListing, canLoadNextPage: canLoadNextPage);
  }
}
