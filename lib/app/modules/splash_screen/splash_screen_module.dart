import 'package:flutter_gofast/app/modules/splash_screen/splash_screen_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gofast/app/modules/splash_screen/splash_screen_page.dart';

class SplashScreenModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashScreenController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashScreenPage()),
      ];

  static Inject get to => Inject<SplashScreenModule>.of();
}
