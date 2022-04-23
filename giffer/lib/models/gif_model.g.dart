// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gif_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GifModel _$GifModelFromJson(Map<String, dynamic> json) => GifModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GifModelToJson(GifModel instance) => <String, dynamic>{
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      contentDescription: json['content_description'] as String?,
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => (e as Map<String, dynamic>).map(
                (k, e) =>
                    MapEntry(k, Media.fromJson(e as Map<String, dynamic>)),
              ))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'content_description': instance.contentDescription,
      'media': instance.media,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'url': instance.url,
    };
