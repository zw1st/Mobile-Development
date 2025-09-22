
import 'package:mobile_dev/data/dtos/films_dto.dart';
import 'package:mobile_dev/domain/models/card.dart';

const _placeHolder = 'https://i.pinimg.com/736x/8f/59/68/8f5968f03ab0b891f58ba7d7ad4d0ede.jpg';

extension FilmDataDtoToModel on FilmDataDto {
  CardData toDomain() => CardData(
    title ?? 'UNKNOWN',
    textDescription: type ?? 'no description',
    imageUrl: imageUrl == 'N/A' ? _placeHolder : imageUrl,
  );
}
