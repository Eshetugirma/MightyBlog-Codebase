
import 'package:blog_application_aastu_grp3/features/article/domain/entities/article.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class ArticleRepository {
  Future<Either<Failure, Article>>? addArticle(Article article);
  Future<Either<Failure, Article>>? editArticle(Article article);
  Future<Either<Failure, List<String>>>? getTag();
}
