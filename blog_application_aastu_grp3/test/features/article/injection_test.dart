// import 'package:blog_app/core/network/network_info.dart';
// import 'package:blog_app/features/article/data/datasources/article_remote_data_source.dart';
// import 'package:blog_app/features/article/data/repositories/article_repository_impl.dart';
// import 'package:blog_app/features/article/domain/repositories/article_repository.dart';
// import 'package:blog_app/features/article/domain/usecases/add_article_usecase.dart';
// import 'package:blog_app/features/article/domain/usecases/edit_article_usecase.dart';
// import 'package:blog_app/features/article/domain/usecases/get_tag_usecase.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get_it/get_it.dart';
// import 'package:http/http.dart' as http;
// import 'package:blog_app/features/article/presentation/bloc/add_article_bloc.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// // Import other dependencies that you want to test

// final sl = GetIt.instance;

// void main() {
//   group('Dependency Injection Test', () {
//     setUp(() {
//       // Register your dependencies before running the tests
//         sl.registerFactory(() => AddArticleBloc(
//       addArticleUsecase: sl(), getTagUsecase: sl()));

//   // Use cases
//   sl.registerSingleton(() => AddArticleUsecase(articleRepository: sl()));
//   sl.registerSingleton(() => GetTag(articleRepository: sl()));

//   // Repository
//   sl.registerLazySingleton<ArticleRepository>(() => ArticleRepositoryImpl(
//       articleRemoteDataSource: sl(), networkInfo: sl()));

//   // Data Sources
//   sl.registerLazySingleton<ArticleRemoteDataSource>(
//       () => ArticleRemoteDataSourceImpl(client: sl()));

//   // Core
//   sl.registerLazySingleton<NetworkInfo>(
//       () => NetworkInfoImpl(internetConnectionChecker: sl()));

//   // External
//   sl.registerLazySingleton(() => http.Client());
//   sl.registerLazySingleton(() => InternetConnectionChecker());

//       // Register other dependencies
//     });

//     test('AddArticleBloc should be registered and resolved', () {
//       // Get an instance of AddArticleBloc from the injector
//       final addArticleBloc = sl<AddArticleBloc>();

//       // Assert that the instance is not null
//       expect(addArticleBloc, isNotNull);
//     });

//     test('Get Tags Usecase should be registered and resolved', () {
//       // Get an instance of http.Client from the injector
//       final getTagsUseCase = sl<GetTag>();

//       // Assert that the instance is not null
//       expect(getTagsUseCase, isNotNull);
//     });

//     test('Add Article Usecase should be registered and resolved', () {
//       // Get an instance of http.Client from the injector
//       final addArticleUseCase = sl<AddArticleUsecase>();

//       // Assert that the instance is not null
//       expect(addArticleUseCase, isNotNull);
//     });
//     test('Article Repository should be registered and resolved', () {
//       // Get an instance of http.Client from the injector
//       final remoteRepo = sl<ArticleRepository>();

//       // Assert that the instance is not null
//       expect(remoteRepo, isNotNull);
//     });
//     test('Article Remote Datasource should be registered and resolved', () {
//       // Get an instance of http.Client from the injector
//       final remoreDataSource = sl<ArticleRemoteDataSource>();

//       // Assert that the instance is not null
//       expect(remoreDataSource, isNotNull);
//     });
//     test('NetworkInfo should be registered and resolved', () {
//       // Get an instance of http.Client from the injector
//       final network = sl<NetworkInfo>();

//       // Assert that the instance is not null
//       expect(network, isNotNull);
//     });
//     test('NetworkInfo should be registered and resolved', () {
//       // Get an instance of http.Client from the injector
//       final network = sl<NetworkInfo>();

//       // Assert that the instance is not null
//       expect(network, isNotNull);
//     });
//     test('Internet Connection Checker should be registered and resolved', () {
//       // Get an instance of http.Client from the injector
//       final connectionChecker = sl<InternetConnectionChecker>();

//       // Assert that the instance is not null
//       expect(connectionChecker, isNotNull);
//     });

//     // Add more test cases for other dependencies

//     tearDown(() {
//       // Clear the registered dependencies after running the tests
//       sl.reset();
//     });
//   });
// }
