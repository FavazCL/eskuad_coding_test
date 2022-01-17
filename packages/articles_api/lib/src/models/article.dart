import 'package:articles_api/articles_api.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'article.g.dart';

/// A single Article Item
@immutable
@JsonSerializable()
@HiveType(typeId: 0)
class Article extends Equatable {
  /// {@macro article}
  const Article({
    required this.id,
    this.title,
    this.author,
    this.createdAt,
  });

  /// The unique identifier of the article
  @HiveField(0)
  final String id;

  /// The title of the article
  @HiveField(1)
  final String? title;

  /// The author of the article
  @HiveField(2)
  final String? author;

  /// The date of create
  @HiveField(3)
  final DateTime? createdAt;

  /// Deserializes the given [JsonMap] into a [Article].
  static Article fromJson(JsonMap json) => _$ArticleFromJson(json);

  /// Converts this [Article] into a [JsonMap].
  JsonMap toJson() => _$ArticleToJson(this);

  @override
  List<Object?> get props => [id, title, author, createdAt];
}
