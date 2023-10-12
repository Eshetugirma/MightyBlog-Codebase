import 'package:blog_application_aastu_grp3/core/errors/failures.dart';
import 'package:blog_application_aastu_grp3/core/usecases/user_usecase.dart';
import 'package:blog_application_aastu_grp3/features/article/domain/entities/article.dart';
import 'package:blog_application_aastu_grp3/features/article/domain/repositories/article_repository.dart';
import 'package:dartz/dartz.dart';

class EditArticleUsecase implements UseCase<Article, EditArticleParams> {
  final ArticleRepository articleRepository;
  EditArticleUsecase({required this.articleRepository});

  @override
  Future<Either<Failure, Article>?> call(
      EditArticleParams editArticleParams) async {
    return await articleRepository.addArticle(editArticleParams.article);
  }
}

class EditArticleParams  {
  final Article article;
  const EditArticleParams({required this.article});

}
