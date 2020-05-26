import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../core/consts/routers_const.dart';
import '../../interfaces/auth_repository_interface.dart';

part 'intro_controller.g.dart';

class IntroController = _IntroControllerBase with _$IntroController;

abstract class _IntroControllerBase with Store {

  IAuthRepository authRepository;

  IntroController() {
    authRepository = Modular.get<IAuthRepository>();
  }

  @action
  void doEnter() {
    Modular.to.pushNamed(RoutersConst.login);
  }

  @action
  void doGoogle() {
    authRepository.loginGoogle().then((result) {
      if(result.success) {
        Modular.to.pushReplacementNamed(RoutersConst.home);
      } else {
        print(result.message);
      }
    });
  }
}
