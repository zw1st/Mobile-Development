import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_dev/components/utils/debounce.dart';
import 'package:mobile_dev/presentation/details_page/details_page.dart';
import 'package:mobile_dev/presentation/home_page/bloc/bloc.dart';
import 'package:mobile_dev/presentation/home_page/bloc/events.dart';
import 'package:mobile_dev/presentation/home_page/bloc/state.dart';
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

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(const HomeLoadDataEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: CupertinoSearchTextField(
                controller: searchController,
                onChanged: (search){
                  Debounce.run(() => context.read<HomeBloc>().add(HomeLoadDataEvent(search: search)));
                },
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) => !state.isLoading
                  ? Expanded(
                      child: RefreshIndicator(
                        onRefresh: _onRefresh,
                        child: ListView.builder(  
                          padding: EdgeInsets.zero,
                          itemCount: state.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            final data = state.data?[index];
                            return data != null
                                ? _Card.fromData(
                                    data,
                                    onLike: (String title, bool isLiked) =>
                                        _showSnackBar(context, title, isLiked),
                                    onTap: () => _navToDetails(context, data),
                                  )
                                : const SizedBox.shrink();
                          },
                        ),
                      ),
                    )
                  : const CircularProgressIndicator(),
            ),
          ],
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

  Future<void> _onRefresh(){
    context.read<HomeBloc>().add(HomeLoadDataEvent(search: searchController.text));
    return Future.value(null);
  }
}
