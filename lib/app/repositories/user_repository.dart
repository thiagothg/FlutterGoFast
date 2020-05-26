import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import 'firebase_repository_base.dart';

class UserRepository extends FirebaseRepositoyBase<User> {
  @override
  String get collection => 'users';

  @override
  User Function(DocumentSnapshot document) get fromMap =>
      (document) => User.fromMap(document);
}
