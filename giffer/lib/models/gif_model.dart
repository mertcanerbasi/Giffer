import 'package:json_annotation/json_annotation.dart';

part 'gif_model.g.dart';

@JsonSerializable()
class GifModel {
  GifModel({
    this.results,
  });

  List<Result>? results;

  factory GifModel.fromJson(Map<String, dynamic> json) => _$GifModelFromJson(json);
  Map<String, dynamic> toJson() => _$GifModelToJson(this);
}

@JsonSerializable()
class Result {
  Result({
    this.contentDescription,
    this.media,
  });

  @JsonKey(name: 'content_description')
  String? contentDescription;
  List<Map<String, Media>>? media;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Media {
  Media({
    this.url,
  });

  String? url;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
