import 'package:blog_application_aastu_grp3/core/errors/exceptions.dart';
import 'package:blog_application_aastu_grp3/core/errors/failures.dart';
import 'package:blog_application_aastu_grp3/features/article/data/datasources/article_remote_data_source.dart';
import 'package:blog_application_aastu_grp3/features/article/domain/entities/article.dart';
import 'package:blog_application_aastu_grp3/features/article/domain/repositories/article_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/network_info.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource articleRemoteDataSource;

  const ArticleRepositoryImpl({
    required this.articleRemoteDataSource,
  });

  @override
  Future<Either<Failure, Article>>? addArticle(Article article) async {
    try {
      final articleResponse = await articleRemoteDataSource.addArticle(article);
      return articleResponse;
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Article>>? editArticle(Article article) {
    // TODO: implement editArticle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<String>>>? getTag() async {
    try {
      return Right(await articleRemoteDataSource.getTag());
    } on ServerFailure {
      return Left(ServerFailure());
    }
  }
}
