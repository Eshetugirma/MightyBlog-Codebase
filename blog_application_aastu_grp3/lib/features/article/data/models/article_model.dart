import 'package:blog_application_aastu_grp3/features/article/domain/entities/article.dart';

class ArticleModel {
  List<String>? tags;
  String? content;
  String? title;
  String? subTitle;
  String? estimatedReadTime;
  String? user;
  String? image;
  String? imageCloudinaryPublicId;
  String? sId;
  String? createdAt;
  int? iV;
  String? id;

  ArticleModel(
      {this.tags,
      this.content,
      this.title,
      this.subTitle,
      this.estimatedReadTime,
      this.user,
      this.image,
      this.imageCloudinaryPublicId,
      this.sId,
      this.createdAt,
      this.iV,
      this.id});

  static ArticleModel fromEntity(Article article) {
    return ArticleModel(
      tags: article.tags,
      content: article.content,
      title: article.title,
      subTitle: article.subtitle,
      estimatedReadTime: article.estimatedReadTime,
    );
  }

  ArticleModel.fromJson(Map<String, dynamic> json) {
    tags = json['tags'].cast<String>();
    content = json['content'];
    title = json['title'];
    subTitle = json['subTitle'];
    estimatedReadTime = json['estimatedReadTime'];
    user = json['user'];
    image = json['image'];
    imageCloudinaryPublicId = json['imageCloudinaryPublicId'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tags'] = this.tags;
    data['content'] = this.content;
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['estimatedReadTime'] = this.estimatedReadTime;
    data['user'] = this.user;
    data['image'] = this.image;
    data['imageCloudinaryPublicId'] = this.imageCloudinaryPublicId;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}
