part of 'add_article_bloc.dart';

sealed class AddArticleEvent extends Equatable {
  const AddArticleEvent();

  @override
  List<Object> get props => [];
}

class AddArticlesEvent extends AddArticleEvent{
  final Article article;

  const AddArticlesEvent({required this.article});
  
  @override
  List<Object> get props => [article];
}
class GetTagsEvent extends AddArticleEvent{}
