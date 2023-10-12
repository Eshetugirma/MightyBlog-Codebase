import 'package:blog_app/core/network/network_info.dart';
import 'package:blog_app/features/article/data/datasources/article_remote_data_source.dart';
import 'package:blog_app/features/article/data/repositories/article_repository_impl.dart';
import 'package:blog_app/features/article/domain/repositories/article_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'article_repository_test.mocks.dart';

@GenerateMocks([NetworkInfo])
@GenerateMocks([ArticleRemoteDataSource], customMocks: [MockSpec<
ArticleRemoteDataSource>(as: #MockRemoteDataSource, 
  )])

void main(){
  late ArticleRepository repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ArticleRepositoryImpl(articleRemoteDataSource: mockRemoteDataSource, networkInfo: mockNetworkInfo);

  });

  

  void runTestOnline(Function body){
  group('device is online', () { 
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

        
    });

    body();
  });

  }

  group('getTag', () { 
    const tags =  [
      "Others",
      "Sports",
      "Tech",
      "Politics",
      "Art",
      "Design",
      "Culture",
      "Production"
    ];

    runTestOnline((){
      test('should return remote data when call to remote data source is successful', () async{
        // arrange
        when(mockRemoteDataSource.getTag()).thenAnswer((_) async => tags);

        // act
        final result = await repository.getTag();

        // assert
        expect(result, equals(const Right(tags)));
        verify(mockRemoteDataSource.getTag());
        verifyNoMoreInteractions(mockRemoteDataSource);

      });
    });
  });
  
}
