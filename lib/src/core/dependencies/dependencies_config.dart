part of 'dependencies.dart';

final configProvider =
    StateNotifierProvider<ConfigNotifier, ConfigState>((ref) {
  return ConfigNotifier();
});

final dioProvider = Provider<Dio>((ref) {
  final baseUrl = ref.watch(configProvider).baseUrl;

  BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 20000,
    receiveTimeout: 20000,
  );
  return Dio(options);
});
