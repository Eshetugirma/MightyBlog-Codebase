import 'package:blog_application_aastu_grp3/core/errors/failures.dart';
import 'package:blog_application_aastu_grp3/core/usecases/user_usecase.dart';
import 'package:blog_application_aastu_grp3/features/article/domain/repositories/article_repository.dart';
import 'package:dartz/dartz.dart';

class GetTag implements UseCase<List<String>, NoParams> {
  final ArticleRepository articleRepository;
  GetTag({required this.articleRepository});

  @override
  Future<Either<Failure, List<String>>?> call(NoParams params) async {
    return await articleRepository.getTag();
  }
}
