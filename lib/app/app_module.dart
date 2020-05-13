import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'app_controller.dart';
import 'app_widget.dart';

import 'core/consts/routers_const.dart';
import 'core/interfaces/auth_repository_interface.dart';
import 'core/interfaces/shared_repository_interface.dart';
import 'core/repositories/auth_repository.dart';
import 'core/repositories/shared_repository.dart';
import 'modules/home/home_module.dart';
import 'modules/intro/intro_module.dart';
import 'modules/login/login_module.dart';
import 'modules/splash_screen/splash_screen_module.dart';

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
      module: SplashScreenModule(), transition: TransitionType.fadeIn),
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
