import 'package:kredit_plus_test/core/util/datastate.dart';
import 'package:kredit_plus_test/features/list_product/domain/entities/product_entity.dart';

abstract class ProductRepository{
  Future<DataState<List<ProductEntity>>> getProducts();
}