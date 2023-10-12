import 'package:bloc/bloc.dart';
import 'package:blog_application_aastu_grp3/features/get_article/data/datasources/blog_remote_data_source.dart';
import 'package:blog_application_aastu_grp3/features/get_article/data/repositories/article_repository_impl.dart';
import 'package:blog_application_aastu_grp3/features/get_article/domain/usecases/get_articles.dart';
import 'package:blog_application_aastu_grp3/features/get_article/domain/usecases/search_articel.dart';
import 'package:flutter/material.dart';
import '../../../data/models/article_model.dart';
import '../../../domain/repositories/articles_repository.dart';

part 'get_article_event.dart';
part 'get_article_state.dart';

class GetArticleBloc extends Bloc<GetArticleEvent, GetArticleState> {
  GetArticleBloc() : super(GetArticleInitial()) {
    on<GetAllArticlesEvent>((event, emit) async {
      ArticleRemoteDataSource remoteDataSource = ArticleRemoteDataSourceImpl();
      ArticleRepository repository = ArticleRepositoryImpl(remoteDataSource);

      final articleUsecase = GetArticles(repository);
      final newData = await articleUsecase.call();
      if (newData.isRight()) {
        emit(OnArticleLoaded(data: newData.getOrElse(() => [])));
      }
    });

    on<GetSearchedArticleEvent>((event, emit) async {
      ArticleRemoteDataSource remoteDataSource = ArticleRemoteDataSourceImpl();
      ArticleRepository repository = ArticleRepositoryImpl(remoteDataSource);
      emit(OnLoadingState());
      final searchArticleUsecase = SearchArticleUsecase(repository);
      final newData =
          await searchArticleUsecase.call(event.searchParam, event.filterParam);
      if (newData.isRight()) {
        emit(OnArticleLoaded(data: newData.getOrElse(() => [])));
      }
    });
  }
}
