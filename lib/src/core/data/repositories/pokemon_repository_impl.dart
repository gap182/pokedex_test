import 'package:pokemon_test/src/core/data/services/pokemon_service.dart';
import 'package:pokemon_test/src/core/domain/entities/pokemon_entity.dart';
import 'package:pokemon_test/src/core/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_test/src/core/utils/error_handler.dart';
import 'package:pokemon_test/src/core/utils/response_model.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(
    this.service,
  );
  final PokemonService service;

  @override
  Future<ResponseModel<PokemonEntity, ErrorHandler>> getPokemonInfo(
      String id) async {
    final response = await service.getPokemonInfo(id);
    return response;
  }
}
