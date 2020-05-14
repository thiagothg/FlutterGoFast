import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/splash_controller.dart';
import '../views/pages/splash/splash_page.dart';


class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => SplashController()),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, child: (_, args) => SplashPage()),
  ];

  static Inject get to => Inject<SplashModule>.of();
}