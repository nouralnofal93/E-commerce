import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/firestore_services.dart';
import 'package:e_commerce/utilities/api_path.dart';

abstract class Database {
  Stream<List<Product>> salesProductsStream();
  Stream<List<Product>> newProductsStream();
  Future<void> setProduct(Product product);
}

class FireStoreDatabase implements Database {
  final String uid;
  final _service = FirestoreServices.instanc;

  FireStoreDatabase(this.uid);

  @override
  Stream<List<Product>> salesProductsStream() => _service.collectionStream(
        path: ApiPath.products(),
        builder: (data, documentId) => Product.fromMap(data!, documentId),
        queryBuilder: (query) => query.where("discountValue", isNotEqualTo: 0),
      );

  @override
  Stream<List<Product>> newProductsStream() => _service.collectionStream(
        path: ApiPath.products(),
        builder: (data, documentId) => Product.fromMap(data!, documentId),
        queryBuilder: (query) => query.where("discountValue", isEqualTo: 0),
      );

  Future<void> setProduct(Product product) async =>
      _service.setData(path: 'products/${product.id}', data: product.toMap());
}
