part of 'get_article_bloc.dart';

@immutable
sealed class GetArticleState {}

final class GetArticleInitial extends GetArticleState {}

class OnLoadingState extends GetArticleState {}

class OnArticleLoaded extends GetArticleState {
  final List<Data> data;
  OnArticleLoaded({required this.data});
}
