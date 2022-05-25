import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokemon_test/src/core/data/models/pokemon_model.dart';
import 'package:pokemon_test/src/core/domain/entities/pokemon_entity.dart';
import 'package:pokemon_test/src/core/utils/error_handler.dart';
import 'package:pokemon_test/src/core/utils/response_model.dart';

class PokemonService {
  PokemonService({
    required this.dio,
  });
  final Dio dio;

  Future<ResponseModel<PokemonEntity, ErrorHandler>> getPokemonInfo(
      String id) async {
    try {
      final response = await dio.get('pokemon/$id');
      final pokemonModel = PokemonModel.fromMap(response.data);
      return ResponseModel(response: pokemonModel.toEntity(), error: null);
    } on DioError catch (e) {
      if (e.error == SocketException) {
        return ResponseModel(
          response: null,
          error: ErrorHandler(
            statusCode: e.response?.statusCode ?? -1,
            keyId: "no_internet",
          ),
        );
      } else {
        return ResponseModel(
          response: null,
          error: ErrorHandler(
              statusCode: e.response?.statusCode ?? -1, keyId: "server_error"),
        );
      }
    } catch (e) {
      return ResponseModel(
        response: null,
        error: ErrorHandler(statusCode: -1, keyId: "other_error"),
      );
    }
  }
}
