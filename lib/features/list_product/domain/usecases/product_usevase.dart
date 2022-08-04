import 'package:kredit_plus_test/core/util/datastate.dart';
import 'package:kredit_plus_test/features/list_product/domain/entities/product_entity.dart';
import 'package:kredit_plus_test/features/list_product/domain/repositories/product_repository.dart';

class ProductUsecase {
  ProductUsecase(this._repository);

  final ProductRepository _repository;

  Future<DataState<List<ProductEntity>>> getProducts() => _repository.getProducts();
}
