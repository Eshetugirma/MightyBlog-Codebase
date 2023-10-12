import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/article_model.dart';

abstract class ArticleRepository{
  Future<Either<Failure, List<Data>>> getArticle();
  Future<Either<Failure, List<Data>>> searchArticle(String searchParam, String filterParam);
}