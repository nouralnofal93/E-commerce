import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreServices {
  FirestoreServices._();
  static final instanc = FirestoreServices._();
  final _fireStoreInst = FirebaseFirestore.instance;

  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) async {
    final refrence = _fireStoreInst.doc(path);
    debugPrint('requstData: $data');
    await refrence.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final refrence = _fireStoreInst.doc(path);
    debugPrint('path: $path');
    await refrence.delete();
  }

  Stream<T> documentStream<T>(
      {required String path,
      required T Function(Map<String, dynamic>? data, String docId) builder}) {
    final refrence = _fireStoreInst.doc(path);
    final snapshots = refrence.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  Stream<List<T>> collectionStream<T>(
      {required String path,
      required T Function(Map<String, dynamic>? data, String docId) builder,
      Query Function(Query query)? queryBuilder,
      int Function(T lhs, T rhs)? sort}) {
    Query query = _fireStoreInst.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshoot) =>
              builder(snapshoot.data() as Map<String, dynamic>, snapshoot.id))
          .where((element) => element != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}
