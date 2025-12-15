// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'films_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmsDto _$FilmsDtoFromJson(Map<String, dynamic> json) => FilmsDto(
      search: (json['Search'] as List<dynamic>?)
          ?.map((e) => FilmDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

FilmDataDto _$FilmDataDtoFromJson(Map<String, dynamic> json) => FilmDataDto(
      imdbID: json['imdbID'] as String?,
      title: json['Title'] as String?,
      type: json['Type'] as String?,
      imageUrl: json['Poster'] as String?,
    );
