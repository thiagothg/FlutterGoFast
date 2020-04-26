import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/app_controller.dart';
import 'package:flutter_gofast/app/core/intercionalization/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer( builder: (context) {
        return MaterialApp(
          navigatorKey: Modular.navigatorKey,
          title: 'Flutter Slidy',
          theme: Modular.get<AppController>().themeApp.getTheme(),
          initialRoute: '/',
          onGenerateRoute: Modular.generateRoute,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('pt', 'BR')
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if(supportedLocale.languageCode == locale.languageCode 
                && supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
            }
            return supportedLocales.first;
          },
        );
      }
    );
  }
}
