import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
      ),
      home: const MyHomePage(title: 'Список фильмов'),
    );
  }
}

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
      body: const MyWidget(),
    );
  }
}

class _CardData {
  final String text;
  final String textDescription;
  final String? imageUrl;

  _CardData(
    this.text, {
    required this.textDescription,
    this.imageUrl,
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfCards = [
      _CardData(
        'Kill Bill! (vol. 1)',
        textDescription: 'Крутой фильм от Квентина Тарантино',
        imageUrl: 'https://trueposters.ru/pictures/product/small/5485_small.jpg',
      ),
      _CardData(
        'Little women',
        textDescription: 'Не смотрел пока, не могу ничего сказать',
        imageUrl: 'https://i.pinimg.com/originals/4f/8d/e1/4f8de1ec6a7a0b90350b3796aaa6762d.jpg'
      ),
      _CardData(
          'Координаты Скайфолл',
          textDescription: 'Дэниэл Крейг в главной роли',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK-NkvOBhHvVUqovZ5g8-vhhD1pzd4plT1Mw&s'
      ),
      _CardData(
        'Довод',
        textDescription: 'Кто-то что-то понял?',
        imageUrl: 'https://ae04.alicdn.com/kf/S3a40caefe3c445509b193f3da73a1a26Y.jpg',
      ),
      _CardData(
          'Сияние',
          textDescription: 'Это классика, ее знать надо',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI_BAW2LZvP3QYZqej7X8yRKGks88cFNsueA&s'
      ),
      _CardData(
          'Тайна Коко',
          textDescription: 'Тоже не смотрел',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjlyWH7DDPlB8xSs_mZnhXT2hIlRfgCeqszw&s'
      ),
    ];

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listOfCards.map((e) => _Card.fromData(e)).toList(),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String text;
  final String textDescription;
  final String? imageUrl;

  const _Card(
    this.text, {
    required this.textDescription,
    this.imageUrl,
  });

  factory _Card.fromData(_CardData data) => _Card(
        data.text,
        textDescription: data.textDescription,
        imageUrl: data.imageUrl,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.orange.shade200,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 140,
              width: 100,
              child: Image.network(
                imageUrl ?? '',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Placeholder(),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    textDescription,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
