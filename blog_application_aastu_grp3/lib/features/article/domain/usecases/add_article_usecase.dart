import 'package:blog_application_aastu_grp3/core/usecases/user_usecase.dart';
import 'package:blog_application_aastu_grp3/features/article/domain/entities/article.dart';
import 'package:blog_application_aastu_grp3/features/article/domain/repositories/article_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

class AddArticleUsecase implements UseCase<Article, AddArticleParams> {
  final ArticleRepository articleRepository;
  AddArticleUsecase({required this.articleRepository});

  @override
  Future<Either<Failure, Article>?> call(
      AddArticleParams addArticleParams) async {
    print("here usecase");
    return await articleRepository.addArticle(addArticleParams.article);
  }
}

class AddArticleParams {
  final Article article;
  const AddArticleParams({required this.article});
}
