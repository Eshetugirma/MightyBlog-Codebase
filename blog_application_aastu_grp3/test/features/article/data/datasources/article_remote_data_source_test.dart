import 'package:blog_application_aastu_grp3/features/article/data/datasources/article_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'article_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late ArticleRemoteDataSource remoteDataSource;

  setUp(() {
    mockClient = MockClient();
    remoteDataSource = ArticleRemoteDataSourceImpl(client: mockClient);
  });

  group('getTags', () {
    test('should return a list of tags when the request is successful',
        () async {
      final mockResponse = http.Response(
        '{"success": true, "tags":  ["others","sports","oech","politics","art","design","culture","production",]}',
        200,
      );

      when(mockClient.get(any)).thenAnswer((_) async => mockResponse);

      final tags = await remoteDataSource.getTag();

      expect(tags, [
        "others",
        "sports",
        "oech",
        "politics",
        "art",
        "design",
        "culture",
        "production",
      ]);
    });
  });
}
