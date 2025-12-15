import 'package:mobile_dev/domain/models/card.dart';
import 'package:mobile_dev/repositories/api_repository.dart';

class MockRepository extends ApiInterface {
  @override
  Future<List<CardData>> loadData() async {
    return [
      CardData(
        'Kill Bill! (vol. 1)',
        textDescription: 'Крутой фильм от Квентина Тарантино',
        imageUrl: 'https://trueposters.ru/pictures/product/small/5485_small.jpg',
      ),
      CardData('Little women',
          textDescription: 'Не смотрел пока, не могу ничего сказать',
          imageUrl: 'https://i.pinimg.com/originals/4f/8d/e1/4f8de1ec6a7a0b90350b3796aaa6762d.jpg'),
      CardData('Координаты Скайфолл',
          textDescription: 'Дэниэл Крейг в главной роли',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK-NkvOBhHvVUqovZ5g8-vhhD1pzd4plT1Mw&s'),
      CardData(
        'Довод',
        textDescription: 'Кто-то что-то понял?',
        imageUrl: 'https://ae04.alicdn.com/kf/S3a40caefe3c445509b193f3da73a1a26Y.jpg',
      ),
      CardData('Сияние',
          textDescription: 'Это классика, ее знать надо',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI_BAW2LZvP3QYZqej7X8yRKGks88cFNsueA&s'),
      CardData('Тайна Коко',
          textDescription: 'Тоже не смотрел',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjlyWH7DDPlB8xSs_mZnhXT2hIlRfgCeqszw&s'),
    ];
  }
}
