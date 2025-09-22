import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_dev/presentation/details_page/details_page.dart';
import 'package:mobile_dev/repositories/film_repository.dart';
import 'package:mobile_dev/repositories/mock_repository.dart';

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
    final data = FilmRepository().loadData();
    return Center(
      child: FutureBuilder(
        future: data,
        builder: (context, snapshot) => SingleChildScrollView(
          child: snapshot.hasData
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      snapshot.data?.map((data) {
                        return _Card.fromData(
                          data,
                          onLike: (String title, bool isLiked) =>
                              _showSnackBar(context, title, isLiked),
                          onTap: () => _navToDetails(context, data),
                        );
                      }).toList() ??
                      [],
                )
              : const CircularProgressIndicator(),
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