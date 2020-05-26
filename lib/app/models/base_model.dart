import 'package:cloud_firestore/cloud_firestore.dart';

import '../interfaces/base_model_interface.dart';

class BaseModel implements IBaseModelInterface  {

  String id;
  bool isActive = true;
  Timestamp createdAt;
  Timestamp updateAt;

  BaseModel();

  @override
  BaseModel.fromMap(DocumentSnapshot document) {
    id = document.documentID;
    isActive = document.data['isActive'];
    createdAt = document.data['createdAt'];
    updateAt = document.data['updateAt'];
  }

  @override
  Map toMap() {
    var map = <String, dynamic>{};
    map['isActive'] = isActive;
    map['createAt'] = createdAt;
    map['updateAt'] = updateAt;
    
    return map;
  }

  @override
  void disableDocument() => isActive = false;

  @override
  void enableDocument() => isActive = true;

  @override
  String documentId() => id;

  @override
  void setCreateTime() => createdAt = Timestamp.now();

  @override
  void setUpdateTime() => updateAt = Timestamp.now();
}