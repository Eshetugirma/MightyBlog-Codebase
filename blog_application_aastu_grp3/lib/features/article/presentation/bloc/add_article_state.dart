part of 'add_article_bloc.dart';

sealed class AddArticleState extends Equatable {
  const AddArticleState();

  @override
  List<Object> get props => [];
}

final class AddArticleInitial extends AddArticleState {}

class ArticleLoading extends AddArticleState {}

class ArticleLoadedTags extends AddArticleState {
  final List<String> tags;
  const ArticleLoadedTags({required this.tags});

  @override
  List<Object> get props => [tags];
}

class ArticleLoaded extends AddArticleState {
  final Article article;
  const ArticleLoaded({required this.article});

  @override
  List<Object> get props => [article];
}

class AddArticleFailed extends AddArticleState {}

class ArticleTagsLoading extends AddArticleState {}
