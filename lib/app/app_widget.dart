import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'core/consts/routers_const.dart';
import 'core/localization/app_localizations.dart';



class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer( builder: (context) {
        return MaterialApp(
          navigatorKey: Modular.navigatorKey,
          title: 'Flutter Slidy',
          theme: Modular.get<AppController>().themeApp.getTheme(),
          themeMode: Modular.get<AppController>().themeMode,
          initialRoute: RoutersConst.intro,
          onGenerateRoute: Modular.generateRoute,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('pt', 'BR')
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
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
