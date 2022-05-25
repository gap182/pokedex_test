import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_test/src/config/states/config_state.dart';

class ConfigNotifier extends StateNotifier<ConfigState> {
  ConfigNotifier() : super(ConfigState.fromMap(const {}));

  Future<void> loadConfigData() async {
    final data = await rootBundle.loadString('assets/config/config.json');
    state = ConfigState.fromJson(data);
  }
}
