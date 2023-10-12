import 'package:blog_application_aastu_grp3/core/errors/exceptions.dart';
import 'package:blog_application_aastu_grp3/core/errors/failures.dart';
import 'package:blog_application_aastu_grp3/features/get_article/data/datasources/blog_remote_data_source.dart';
import 'package:blog_application_aastu_grp3/features/get_article/data/models/article_model.dart';
import 'package:blog_application_aastu_grp3/features/get_article/domain/repositories/articles_repository.dart';
import 'package:dartz/dartz.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleRemoteDataSource remoteDataSource;
  ArticleRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<Data>>> getArticle() async {
    try {
      return Right(await remoteDataSource.getArticles());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Data>>> searchArticle(
      searchParam, filterParam) async {
    try {
      return Right(
          await remoteDataSource.searchArticle(searchParam, filterParam));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
