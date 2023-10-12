part of 'get_article_bloc.dart';

@immutable
sealed class GetArticleEvent {}

class GetAllArticlesEvent extends GetArticleEvent{}

class GetSearchedArticleEvent extends GetArticleEvent{
  final String searchParam;
  final String filterParam;
  GetSearchedArticleEvent({required this.searchParam, required this.filterParam});
}

class GetFilteredArticleEvent extends GetArticleEvent{
  final String filterParam;
  GetFilteredArticleEvent({required this.filterParam});
  
}