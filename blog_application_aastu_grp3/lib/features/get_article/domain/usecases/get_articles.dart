
import 'dart:async';

import 'package:blog_application_aastu_grp3/core/errors/failures.dart';
import 'package:blog_application_aastu_grp3/features/get_article/domain/repositories/articles_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/article_model.dart';

class GetArticles extends Equatable{

  final ArticleRepository repository;

  const GetArticles(this.repository);

  Future<Either<Failure,List<Data>>> call() async{
    return await repository.getArticle();
  }

  @override
  List<Object?> get props =>[repository];
  
}