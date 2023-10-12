import 'dart:io';

import 'package:equatable/equatable.dart';  

class Article extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final List<String> tags;
  final String content;
  final String estimatedReadTime;
  final File? photoUrl;

  const Article(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.tags,
      required this.content,
      required this.estimatedReadTime,
      this.photoUrl});

  @override
  List<Object?> get props =>
      [id, title, subtitle, tags, content, estimatedReadTime, photoUrl];
}
