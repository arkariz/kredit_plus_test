import 'package:flutter_test/flutter_test.dart';
import 'package:kredit_plus_test/core/util/datastate.dart';
import 'package:kredit_plus_test/features/list_product/domain/entities/product_entity.dart';
import 'package:kredit_plus_test/features/list_product/domain/usecases/product_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../test_helper.mocks.dart';

void main() {
  late MockProductRepository mockProductRepository;
  late ProductUsecase usecase;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = ProductUsecase(mockProductRepository);
  });

  final ratingDummy = RatingEntity(rate: 3.5, count: 240);
  final productOne = ProductEntity(
    id: 1,
    title: "product 1",
    price: 10000,
    description: "This is product one",
    category: "Art",
    image: "productoneimage",
    rating: ratingDummy,
  );
  final productTwo = ProductEntity(
    id: 2,
    title: "product 2",
    price: 20000,
    description: "This is product two",
    category: "car",
    image: "producttwoimage",
    rating: ratingDummy,
  );

  final productList = [productOne, productTwo];

  Future<DataState<List<ProductEntity>>> dummySuccess() => Future.value(DataSuccess(productList));
  Future<DataState<List<ProductEntity>>> dummyFailed() => Future.value(DataFailed("gagal mengambil produk"));

  test(
    'should get all product from the repository success',
    () async {
      // arrange
      when(mockProductRepository.getProducts()).thenAnswer((_) async => dummySuccess());

      // act
      final result = await usecase.getProducts();

      // assert
      expect(result.data!.length, equals(productList.length));
    },
  );

  test(
    'should get all product from the repository failed',
    () async {
      // arrange
      when(mockProductRepository.getProducts()).thenAnswer((_) async => dummyFailed());

      // act
      final result = await usecase.getProducts();

      // assert
      final dummyResponse = await dummyFailed();
      expect(result.error, dummyResponse.error);
    },
  );
}
