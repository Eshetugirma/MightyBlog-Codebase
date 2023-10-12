import 'package:bloc/bloc.dart';
import 'package:blog_application_aastu_grp3/core/errors/failures.dart';
import 'package:blog_application_aastu_grp3/core/network/network_info.dart';
import 'package:blog_application_aastu_grp3/core/usecases/user_usecase.dart';
import 'package:blog_application_aastu_grp3/features/article/data/datasources/article_remote_data_source.dart';
import 'package:blog_application_aastu_grp3/features/article/data/repositories/article_repository_impl.dart';
import 'package:blog_application_aastu_grp3/features/article/domain/entities/article.dart';
import 'package:blog_application_aastu_grp3/features/article/domain/repositories/article_repository.dart';
import 'package:blog_application_aastu_grp3/features/article/domain/usecases/add_article_usecase.dart';
import 'package:blog_application_aastu_grp3/features/article/domain/usecases/get_tag_usecase.dart';
// import 'package:blog_app/features/article/domain/usecases/edit_article_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'add_article_event.dart';
part 'add_article_state.dart';

const SERVERMESSAGE = "SERVER FALIURE";
const CACHEMESSAGE = "CACHE FALIURE";

class AddArticleBloc extends Bloc<AddArticleEvent, AddArticleState> {
  // final AddArticleUsecase addArticleUsecase;
  // final GetTag getTagUsecase;

  AddArticleState get initialState => AddArticleInitial();

  AddArticleBloc() : super(AddArticleInitial()) {
    ArticleRemoteDataSource remoteDataSource =
        ArticleRemoteDataSourceImpl(client: http.Client());

    ArticleRepository repository = ArticleRepositoryImpl(
      articleRemoteDataSource: remoteDataSource,
    );
    AddArticleUsecase addArticleUsecase =
        AddArticleUsecase(articleRepository: repository);
    GetTag getTagUsecase = GetTag(articleRepository: repository);

    on<AddArticlesEvent>((event, emit) async {
      print('ADFADKF');
      emit(ArticleLoading());

      try {
        final result =
            await addArticleUsecase(AddArticleParams(article: event.article));
        result!.fold((faliure) => emit(AddArticleFailed()),
            (article) => emit(ArticleLoaded(article: article)));
      } catch (e) {
        emit(AddArticleFailed());
      }
    });
    on<GetTagsEvent>((event, emit) async {
      emit(ArticleTagsLoading());
      final result = await getTagUsecase(NoParams());
      result!.fold((faliure) => emit(AddArticleFailed()),
          (tags) => emit(ArticleLoadedTags(tags: tags)));
    });
  }

  String _mapFailureToError(Failure failures) {
    switch (failures.runtimeType) {
      case ServerFailure:
        return SERVERMESSAGE;
      default:
        return "UNEXPECTED ERROR";
    }
  }
}
