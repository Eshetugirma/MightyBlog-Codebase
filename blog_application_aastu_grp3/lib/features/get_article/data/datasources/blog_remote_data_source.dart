import 'dart:convert';

import 'package:blog_application_aastu_grp3/core/errors/exceptions.dart';
import 'package:blog_application_aastu_grp3/features/get_article/data/models/article_model.dart';
import "package:http/http.dart" as http;

abstract class ArticleRemoteDataSource {
  Future<List<Data>> getArticles();
  Future<List<Data>> searchArticle(String searchParam, String filterParam);
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  @override
  Future<List<Data>> getArticles() async {
    return await _getDataFromUrl();
  }

  @override
  Future<List<Data>> searchArticle(String searchParam,String filterParam) async {
    return await _searchDataFromApi(searchParam, filterParam);
  }

  Future<List<Data>> _getDataFromUrl() async {
    final response = await http
        .get(Uri.parse('https://blog-api-4z3m.onrender.com/api/v1/article'));

    var fetchedData = <Data>[];
    if (response.statusCode == 200) {
      for (var art in jsonDecode(response.body)['data']) {
        fetchedData.add(Data.fromJson(art));
      }
      return fetchedData;
    } else {
      throw ServerException();
    }
  }
  
   Future<List<Data>> _searchDataFromApi(String searchParam, String filterParam) async {
    final response = await http
        .get(Uri.parse('https://blog-api-4z3m.onrender.com/api/v1/article?tags=$filterParam&searchParams=$searchParam'));

    var fetchedData = <Data>[];
    if (response.statusCode == 200) {
      for (var art in jsonDecode(response.body)['data']) {
        fetchedData.add(Data.fromJson(art));
      }
      return fetchedData;
    } else {
      throw ServerException();
    }
  }
}
