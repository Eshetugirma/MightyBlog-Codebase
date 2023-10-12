import 'package:blog_app/features/article/domain/entities/article.dart';
import 'package:blog_app/features/article/domain/repositories/article_repository.dart';
import 'package:blog_app/features/article/domain/usecases/add_article_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

class MockArticleRepository extends Mock implements ArticleRepository {}

@GenerateMocks([Article])
void main() {
  late AddArticleUsecase usecase;
  late MockArticleRepository mockArticleRepository;
  late Article article;

  setUp(() {
    mockArticleRepository = MockArticleRepository();
    usecase = AddArticleUsecase(articleRepository: mockArticleRepository);
    article = const Article(
        id: "1",
        title: 'title',
        subtitle: 'subtitle',
        tags: ['others'],
        content: 'content',
        estimatedReadTime: '1',
        photoUrl:
            "https://bocdn.ecotree.green/blog/0001/01/ad46dbb447cd0e9a6aeecd64cc2bd332b0cbcb79.jpeg?d=240x135");
  });

  test('should add article', () async {
    // arrange
    when(mockArticleRepository.addArticle(article))
        .thenAnswer((_) async => Right(article));

    // act
    final result = await usecase(AddArticleParams(article: article));

    // assert
    expect(result, Right(article));
    verify(mockArticleRepository.addArticle(article));
  });
}
