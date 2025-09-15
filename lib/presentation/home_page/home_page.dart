import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_dev/presentation/details_page/details_page.dart';

import '../../domain/models/card.dart';

part 'card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfCards = [
      CardData(
        'Kill Bill! (vol. 1)',
        textDescription: 'Крутой фильм от Квентина Тарантино',
        imageUrl:
            'https://trueposters.ru/pictures/product/small/5485_small.jpg',
      ),
      CardData('Little women',
          textDescription: 'Не смотрел пока, не могу ничего сказать',
          imageUrl:
              'https://i.pinimg.com/originals/4f/8d/e1/4f8de1ec6a7a0b90350b3796aaa6762d.jpg'),
      CardData('Координаты Скайфолл',
          textDescription: 'Дэниэл Крейг в главной роли',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK-NkvOBhHvVUqovZ5g8-vhhD1pzd4plT1Mw&s'),
      CardData(
        'Довод',
        textDescription: 'Кто-то что-то понял?',
        imageUrl:
            'https://ae04.alicdn.com/kf/S3a40caefe3c445509b193f3da73a1a26Y.jpg',
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
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listOfCards
              .map((e) => _Card.fromData(
                    e,
                    onLike: (title, isLiked) =>
                        _showSnackBar(context, title, isLiked),
                    onTap: () => _navToDetails(context, e),
                  ))
              .toList(),
        ),
      ),
    );
  }

  void _navToDetails(BuildContext context, CardData data) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => DetailsPage(data)),
    );
  }

  void _showSnackBar(BuildContext context, String name, bool isLiked) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Film $name ${isLiked ? 'liked' : 'disliked'}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          backgroundColor: Colors.orange,
          duration: const Duration(seconds: 1),
        ),
      );
    });
  }
}
