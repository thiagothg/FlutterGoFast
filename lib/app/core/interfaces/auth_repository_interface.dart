import '../features/responses/response_default.dart';

abstract class IAuthRepository {
  Future<DefaultResponse> loginGoogle();
  Future<DefaultResponse> loginEmailPassword({String email, String password});
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password});
  Future<DefaultResponse> getUser();
  Future<DefaultResponse> logOut();
}
