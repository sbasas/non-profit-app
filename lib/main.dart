import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/services/analytics_service.dart';
import 'core/services/connectivity_service.dart';
import 'core/services/secure_storage_service.dart';
import 'core/theme/app_theme.dart';
import 'features/navigation/app_router.dart';
import 'features/settings/providers/theme_provider.dart';
import 'features/settings/providers/language_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services
  final analyticsService = AnalyticsService();
  final connectivityService = ConnectivityService();
  final secureStorageService = SecureStorageService();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: _AppWrapper(
        analyticsService: analyticsService,
        connectivityService: connectivityService,
        secureStorageService: secureStorageService,
      ),
    ),
  );
}

class _AppWrapper extends StatelessWidget {
  final AnalyticsService analyticsService;
  final ConnectivityService connectivityService;
  final SecureStorageService secureStorageService;

  const _AppWrapper({
    required this.analyticsService,
    required this.connectivityService,
    required this.secureStorageService,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Non-Profit App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      locale: context.watch<LanguageProvider>().locale,
      routerConfig: AppRouter.router,
      builder: (context, child) {
        ErrorWidget.builder = (FlutterErrorDetails details) {
          debugPrint('App Error: ${details.exception}');
          debugPrint('Stack Trace: ${details.stack}');
          return Container(
            color: Colors.transparent,
            child: Center(
              child: Text(
                'Something went wrong',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        };
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}
