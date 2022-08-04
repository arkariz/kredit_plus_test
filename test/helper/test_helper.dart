import 'package:kredit_plus_test/features/list_product/data/datasources/remote_product_datasource.dart';
import 'package:kredit_plus_test/features/list_product/domain/repositories/product_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    ProductRepository,
    RemoteProductDataSource,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}