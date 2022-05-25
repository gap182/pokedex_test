import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_test/src/config/controllers/config_notifier.dart';
import 'package:pokemon_test/src/config/states/config_state.dart';
import 'package:pokemon_test/src/core/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_test/src/core/data/services/pokemon_service.dart';
import 'package:pokemon_test/src/core/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/controllers/pokedex_controller.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/states/pokedex_state.dart';

part 'dependencies_config.dart';
part 'dependencies_ui.dart';
part 'dependencies_domain.dart';
part 'dependencies_data.dart';
