import 'package:blog_app/core/usecases/usecases.dart';
import 'package:blog_app/features/article/domain/entities/article.dart';
import 'package:blog_app/features/article/domain/repositories/article_repository.dart';
import 'package:blog_app/features/article/domain/usecases/get_tag_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

class MockArticleRepository extends Mock implements ArticleRepository {}

@GenerateMocks([Article])
void main() {
  late MockArticleRepository mockArticleRepository;
  late GetTag usecase;
  late List<String> tags;

  setUp(() {
    mockArticleRepository = MockArticleRepository();
    usecase = GetTag(articleRepository: mockArticleRepository);
    tags = ["others", "art"];
  });
  test('should get article', () async{

    // arrange
    when(mockArticleRepository.getTag()).thenAnswer((_) async => Right(tags));

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result, Right(tags));
    verify(mockArticleRepository.getTag());

  });

}
