// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

/// **************************************************************************
/// TypeAdapterGenerator
/// **************************************************************************
class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final int typeId = 0;

  @override
  Article read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Article(
      id: fields[0] as String,
      title: fields[1] as String?,
      author: fields[2] as String?,
      createdAt: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Article obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

/// **************************************************************************
/// JsonSerializableGenerator
/// **************************************************************************
Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      id: json['objectID'] as String,
      title: json['title'] as String?,
      author: json['author'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
