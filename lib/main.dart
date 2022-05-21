import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:pda/app/utils/dependency_injection.dart';
import 'app/routes/app_pages.dart';

void main() {
  DependencyInjection.init();
  runApp(
    GetMaterialApp(
      title: "临工智科仓储管理系统",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      defaultTransition: Transition.rightToLeft,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'), // English, no country code
      ],
      locale: const Locale('zh'),
    ),
  );
}
