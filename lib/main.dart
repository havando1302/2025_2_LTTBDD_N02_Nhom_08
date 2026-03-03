import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:musicbox/providers/app_provider.dart';
import 'package:musicbox/router/app_router.dart';
import 'package:musicbox/translates/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleProvider(),

      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'MusicBox',
            routerConfig: RouterCustom.router,

            ///trạng thái ngôn ngữ (vi/en)
            locale: localeProvider.locale,

            ///Chuyển đổi ngôn ngữ
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
