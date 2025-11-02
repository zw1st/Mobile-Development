import 'package:equatable/equatable.dart';

import '../../../domain/models/card.dart';

class HomeState extends Equatable {
  final List<CardData>? data;
  final bool isLoading;

  const HomeState({this.data, this.isLoading = false});

  HomeState copyWith({List<CardData>? data, bool? isLoading}) =>
      HomeState(
        data: data ?? this.data,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object?> get props => [
        data,
        isLoading,
      ];
}
