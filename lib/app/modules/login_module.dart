import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/login_controller.dart';
import '../views/pages/login/login_page.dart';


class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => LoginController()),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, child: (_, args) => LoginPage()),
  ];

  static Inject get to => Inject<LoginModule>.of();
}
