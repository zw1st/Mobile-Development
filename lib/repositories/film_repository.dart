import 'package:dio/dio.dart';
import 'package:mobile_dev/data/dtos/films_dto.dart';
import 'package:mobile_dev/data/mappers/films_mapper.dart';
import 'package:mobile_dev/domain/models/card.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_repository.dart';

class FilmRepository extends ApiInterface {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
  static const String _baseUrl = 'https://www.omdbapi.com/?apikey=c8194d3e';

  @override
  Future<List<CardData>?> loadData({s}) async {
    try {
      const String url = _baseUrl;

      final Response<dynamic> response = await _dio.get<Map<dynamic, dynamic>>(
        url,
        queryParameters: s != null ? {"s": s} : {"s": "america"},
      );

      final FilmsDto dto = FilmsDto.fromJson(response.data as Map<String, dynamic>);
      final List<CardData>? data = dto.search?.map((e) => e.toDomain()).toList();
      return data;
    } on DioException catch (e) {
      return null;
    }
  }
}
