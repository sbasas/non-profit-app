import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../config/app_config.dart';
import '../services/api_service.dart';
import '../services/cache_service.dart';
import '../services/analytics_service.dart';
import '../services/connectivity_service.dart';
import '../services/secure_storage_service.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => AppConfig());
  
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  
  // Note: Other services are temporarily disabled for development
  // TODO: Re-enable services when Firebase is configured
  
  sl.registerLazySingleton(() => Dio()
    ..options.baseUrl = AppConfig().apiBaseUrl
    ..options.connectTimeout = const Duration(seconds: 30)
    ..options.receiveTimeout = const Duration(seconds: 30)
    ..interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    )));
  
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => Connectivity());
  
  // Services
  sl.registerLazySingleton(() => ApiService(sl()));
  sl.registerLazySingleton(() => CacheService(sl()));
  sl.registerLazySingleton(() => AnalyticsService());
  sl.registerLazySingleton(() => ConnectivityService(sl()));
  sl.registerLazySingleton(() => SecureStorageService(sl()));
  
  // Repositories
  // sl.registerLazySingleton(() => UserRepository(sl(), sl()));
  // sl.registerLazySingleton(() => EventRepository(sl(), sl()));
  // sl.registerLazySingleton(() => DonationRepository(sl(), sl()));
  
  // Use Cases
  // sl.registerLazySingleton(() => GetUserUseCase(sl()));
  // sl.registerLazySingleton(() => GetEventsUseCase(sl()));
  // sl.registerLazySingleton(() => MakeDonationUseCase(sl()));
  
  // Blocs
  // sl.registerFactory(() => UserBloc(sl()));
  // sl.registerFactory(() => EventBloc(sl()));
  // sl.registerFactory(() => DonationBloc(sl()));
  
  // Initialize Hive
  await Hive.initFlutter();
  // await Hive.openBox('userBox');
  // await Hive.openBox('eventBox');
  // await Hive.openBox('donationBox');
} 