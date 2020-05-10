import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../app_controller.dart';
import '../../core/features/localization/app_translate.dart';
import 'splash_screen_controller.dart';


class SplashScreenPage extends StatefulWidget {
  final String title;
  const SplashScreenPage({Key key, this.title = "SplashScreen"})
      : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState
    extends ModularState<SplashScreenPage, SplashScreenController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslate(context).text('welcome')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                  Modular.get<AppController>().setThemeData(ThemeMode.dark);
              },
              child: Text('Theme dark'),
            ),
            RaisedButton(
              onPressed: (){
                Modular.get<AppController>().setThemeData(ThemeMode.light);
              },
              child: Text('Theme light'),
            ),
          ],
        ),
      ),
    );
  }
}
