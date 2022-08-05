import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:kredit_plus_test/features/list_product/data/datasources/remote_product_datasource.dart';
import 'package:kredit_plus_test/features/list_product/data/repositories/product_repository_impl.dart';
import 'package:kredit_plus_test/features/list_product/domain/repositories/product_repository.dart';
import 'package:kredit_plus_test/features/list_product/domain/usecases/product_usecase.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<http.Client>(http.Client());
  injector.registerSingleton<RemoteProductDataSource>(RemoteProductDatasourceImpl(injector()));
  injector.registerSingleton<ProductRepository>(ProductRepositoryImpl(injector()));
  injector.registerSingleton<ProductUsecase>(ProductUsecase(injector()));
}
