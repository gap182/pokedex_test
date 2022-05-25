import 'package:pokemon_test/src/core/domain/entities/pokemon_entity.dart';
import 'package:pokemon_test/src/core/utils/error_handler.dart';
import 'package:pokemon_test/src/core/utils/response_model.dart';

abstract class PokemonRepository {
  Future<ResponseModel<PokemonEntity, ErrorHandler>> getPokemonInfo(String id);
}
