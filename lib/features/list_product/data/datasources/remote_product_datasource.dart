import 'package:http/http.dart' as http;
import 'package:kredit_plus_test/features/list_product/data/models/product_model.dart';

abstract class RemoteProductDataSource {
  Future<List<ProductModel>> getProducts();
}

class RemoteProductDatasourceImpl implements RemoteProductDataSource {
  final http.Client client;

  RemoteProductDatasourceImpl(this.client);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await client.get(Uri.parse("https://fakestoreapi.com/products"));

      if (response.statusCode == 200) {
        return productModelFromJson(response.body);
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
