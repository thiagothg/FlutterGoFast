import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../features/responses/response_builder.dart';
import '../features/responses/response_default.dart';
import '../interfaces/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepository(this.firebaseAuth);

  @override
  Future<DefaultResponse> getUser() async {
    try {
      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser());
    } on Exception catch (e) {
      return ResponseBuilder.failed(
        object: e, message: 'Falha logar com Google. e: $e');
    }
  }

  @override
  Future<DefaultResponse> logOut() async {
    try {
      await firebaseAuth.signOut();
      return ResponseBuilder.success();
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> loginEmailPassword(
      {String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser());
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> loginGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();
      final googleSignInAccount = await googleSignIn.signIn();
      final googleSignInAuthentication =
          await googleSignInAccount.authentication;

      FirebaseUser firebaseUser;

      if (googleSignInAuthentication.accessToken != null) {
        final credential = GoogleAuthProvider.getCredential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await firebaseAuth.signInWithCredential(credential).then((auth) {
          firebaseUser = auth.user;
        });

        return ResponseBuilder.success<FirebaseUser>(
            object: firebaseUser, message: 'Logou com Sucesso.');
      } else {
        return ResponseBuilder.failed(
          object: null, message: 'Falha logar com Google. ');
      }
    } on Exception catch (e) {
      return ResponseBuilder.failed(
          object: e, message: 'Falha logar com Google. e: $e');
    }
  }

  @override
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password}) async {
    try {
      return await firebaseAuth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((auth) {
        return ResponseBuilder.success<FirebaseUser>(object: auth.user);
      });
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }
}
