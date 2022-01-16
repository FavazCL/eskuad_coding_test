import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'article.g.dart';

/// A single Article Item
@immutable
@HiveType(typeId: 0)
class Article extends Equatable {
  /// {@macro article}
  const Article({
    required this.id,
    this.title,
    this.author,
  });

  /// The unique identifier of the article
  @HiveField(0)
  final int id;

  /// The title of the article
  @HiveField(1)
  final String? title;

  /// The author of the article
  @HiveField(2)
  final String? author;

  @override
  List<Object?> get props => [id, title, author];
}
