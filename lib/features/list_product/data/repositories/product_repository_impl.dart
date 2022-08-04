import 'package:kredit_plus_test/features/list_product/data/datasources/remote_product_datasource.dart';
import 'package:kredit_plus_test/features/list_product/data/models/product_model.dart';
import 'package:kredit_plus_test/features/list_product/domain/entities/product_entity.dart';
import 'package:kredit_plus_test/core/util/datastate.dart';
import 'package:kredit_plus_test/features/list_product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteProductDataSource _datasource;

  ProductRepositoryImpl(this._datasource);
  @override
  Future<DataState<List<ProductEntity>>> getProducts() async {
    try {
      final response = await _datasource.getProducts();
      return DataSuccess(productEntityFromModel(response));
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
