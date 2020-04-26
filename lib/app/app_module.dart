import 'package:flutter_gofast/app/app_controller.dart';
import 'package:flutter_gofast/app/core/interfaces/shared_repository_interface.dart';
import 'package:flutter_gofast/app/core/repositories/shared_repository.dart';
import 'package:flutter_gofast/app/modules/splash_screen/splash_screen_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind<ISharedRepositoryInterface>((i) => SharedRepository(),),
    Bind((i) => AppController()),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, module: SplashScreenModule(), transition: TransitionType.fadeIn),
  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
