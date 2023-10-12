

import 'dart:async';

import 'package:blog_application_aastu_grp3/core/errors/failures.dart';
import 'package:blog_application_aastu_grp3/features/get_article/domain/repositories/articles_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/article_model.dart';

class SearchArticleUsecase extends Equatable{

  final ArticleRepository repository;

  const SearchArticleUsecase(this.repository);

  Future<Either<Failure,List<Data>>> call(String searchParam, String filterParam) async{
    return await repository.searchArticle(searchParam, filterParam);
  }

  @override
  List<Object?> get props =>[repository];
  
}