import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_dev/presentation/home_page/bloc/events.dart';
import 'package:mobile_dev/presentation/home_page/bloc/state.dart';

import '../../../repositories/film_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FilmRepository repo;

  HomeBloc(this.repo) : super(const HomeState()) {
    on<HomeLoadDataEvent>(_onLoadData);
  }

  Future<void> _onLoadData(HomeLoadDataEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));

    final data = await repo.loadData(s: event.search);

    emit(state.copyWith(isLoading: false, data: data));
  }
}
