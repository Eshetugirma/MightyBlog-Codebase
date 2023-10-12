
import 'package:blog_application_aastu_grp3/features/article/data/models/article_model.dart';

abstract class ArticleLocalDataSource {
  Future<ArticleModel> addArticle(ArticleModel article);
  Future<ArticleModel> editArticle(ArticleModel article);
  Future<List<String>> getTag();
}
