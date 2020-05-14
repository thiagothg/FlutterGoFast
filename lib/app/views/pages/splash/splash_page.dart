import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../controllers/app_controller.dart';
import '../../../controllers/splash_controller.dart';
import '../../../core/localization/app_translate.dart';


class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {

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
