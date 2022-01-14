import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// A single Article Item
@immutable
class Article extends Equatable {
  /// {@macro article}
  const Article({
    required this.id,
    this.title,
    this.author,
  });

  /// The unique identifier of the article
  final int id;

  /// The title of the article
  final String? title;

  /// The author of the article
  final String? author;

  @override
  List<Object?> get props => [id, title, author];
  
}
