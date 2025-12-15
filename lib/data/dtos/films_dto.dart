import 'package:json_annotation/json_annotation.dart';

part 'films_dto.g.dart';

@JsonSerializable(createToJson: false)
class FilmsDto {
  @JsonKey(name: "Search")
  final List<FilmDataDto>? search;

  const FilmsDto({this.search});

  factory FilmsDto.fromJson(Map<String, dynamic> json) => _$FilmsDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class FilmDataDto {
  final String? imdbID;
  @JsonKey(name: "Title")
  final String? title;
  @JsonKey(name: "Type")
  final String? type;
  @JsonKey(name: "Poster")
  final String? imageUrl;

  const FilmDataDto({this.imdbID, this.title, this.type, this.imageUrl});

  factory FilmDataDto.fromJson(Map<String, dynamic> json) => _$FilmDataDtoFromJson(json);
}
