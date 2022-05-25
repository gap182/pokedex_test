import 'package:pokemon_test/src/core/domain/entities/pokemon_entity.dart';
import 'package:pokemon_test/src/core/utils/error_handler.dart';
import 'package:pokemon_test/src/features/home/presentation/controllers/home_controller.dart';

class HomeState {
  HomeState({
    this.textToSearch,
    this.pokemonSearchResult,
    this.homeStatus = HomeStatus.initial,
    this.error,
  });
  final String? textToSearch;
  final PokemonEntity? pokemonSearchResult;
  final HomeStatus homeStatus;
  final ErrorHandler? error;

  HomeState copyWith({
    String? textToSearch,
    PokemonEntity? Function()? pokemonSearchResult,
    HomeStatus? homeStatus,
    ErrorHandler? Function()? errorHandler,
  }) {
    return HomeState(
      textToSearch: textToSearch ?? this.textToSearch,
      pokemonSearchResult: pokemonSearchResult != null
          ? pokemonSearchResult()
          : this.pokemonSearchResult,
      homeStatus: homeStatus ?? this.homeStatus,
      error: errorHandler != null ? errorHandler() : error,
    );
  }

  @override
  String toString() {
    return 'HomeState(textToSearch: $textToSearch, pokemonSearchResult: $pokemonSearchResult, homeStatus: $homeStatus, error: $error)';
  }
}
