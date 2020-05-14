import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'controllers/app_controller.dart';
import 'core/consts/routers_const.dart';
import 'interfaces/auth_repository_interface.dart';
import 'interfaces/shared_repository_interface.dart';
import 'modules/home_module.dart';
import 'modules/intro_module.dart';
import 'modules/login_module.dart';
import 'modules/splash_module.dart';
import 'repositories/auth_repository.dart';
import 'repositories/shared_repository.dart';
import 'views/pages/main/app_widget.dart';


class AppModule extends MainModule {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  List<Bind> get binds => [
    Bind<ISharedRepositoryInterface>(
      (i) => SharedRepository(),
    ),
    Bind<IAuthRepository>(
      (i) => AuthRepository(firebaseAuth),
    ),
    Bind((i) => AppController()),
  ];

  @override
  List<Router> get routers => [
    Router(RoutersConst.splash,
      module: SplashModule(), transition: TransitionType.fadeIn),
    Router(RoutersConst.intro,
      module: IntroModule(), transition: TransitionType.fadeIn),
    Router(RoutersConst.login,
      module: LoginModule(), transition: TransitionType.fadeIn),
    Router(RoutersConst.home,
      module: HomeModule(), transition: TransitionType.fadeIn),

  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
