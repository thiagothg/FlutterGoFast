import 'package:flutter_gofast/app/modules/intro/intro_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gofast/app/modules/intro/intro_page.dart';

class IntroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => IntroController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => IntroPage()),
      ];

  static Inject get to => Inject<IntroModule>.of();
}
