import 'dart:io';

import 'package:blog_application_aastu_grp3/core/errors/exceptions.dart';
import 'package:blog_application_aastu_grp3/features/article/domain/entities/article.dart';
import 'package:blog_application_aastu_grp3/features/authentication/data/datasource/auth_local_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import '../../../../core/errors/failures.dart';

abstract class ArticleRemoteDataSource {
  Future<Either<Failure, Article>> addArticle(Article article);
  Future<Article> editArticle(Article article);
  Future<List<String>> getTag();
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final http.Client client;
  const ArticleRemoteDataSourceImpl({required this.client});

  @override
  Future<Either<Failure, Article>> addArticle(Article article) async {
    LocalDataSource localDataSource = LocalDataSource();
    final token = await localDataSource.readFromStorage('Token');

    try {
      var urlString = "https://blog-api-4z3m.onrender.com/api/v1/article";
      var url = Uri.parse(urlString);
      print(url.toString());
      var response = http.MultipartRequest('POST', url);
      response.headers.addAll({
        "Authorization": "Bearer $token",
        "Content-type": "multipart/form-data"
      });
      response.fields['title'] = article.title;
      response.fields['content'] = article.content;
      response.fields['subTitle'] = article.subtitle;
      if (article.estimatedReadTime != null) {
        response.fields['estimatedReadTime'] = article.estimatedReadTime;
      }
      if (article.tags.isNotEmpty) {
        response.fields['tags'] = article.tags.first;
      }
      var headers = {'Content-Type': 'image/jpeg'};
      if (article.photoUrl != null) {
        print("hello from this dsl;kfldsfkdsfds;lfds;lfksd;lfkdsl;fds");
        print(article.photoUrl);
        // ...
        var ext = article.photoUrl!.path.split('.').last;
        print(ext);
        response.files.add(await http.MultipartFile.fromPath(
          'photo',
          article.photoUrl!.path,
          contentType: MediaType('image', 'jpeg'),
        ));
        print(response.files.length);
      }

      var res = await response.send();
      print(res.statusCode);
      if (res.statusCode == 200) {
        return Right(Article(
          content: article.content,
          id: "",
          photoUrl: File(""),
          subtitle: article.subtitle,
          tags: article.tags,
          title: article.title,
          estimatedReadTime: article.estimatedReadTime ?? "",
        ));
      }

      return Left(ServerFailure());
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Article> editArticle(Article article) {
    // TODO: implement editArticle
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getTag() async {
    final url = Uri.parse('https://blog-api-4z3m.onrender.com/api/v1/tags');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<String> tags = List<String>.from(jsonData['tags']);
      return tags;
    } else {
      throw ServerException();
    }
  }
}
