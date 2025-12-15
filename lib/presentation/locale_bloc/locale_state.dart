import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:copy_with_extension/copy_with_extension.dart';


part 'locale_state.g.dart';

@CopyWith()
class LocaleState extends Equatable {
  final Locale currentLocale;

  const LocaleState({required this.currentLocale});

  @override
  List<Object?> get props => [currentLocale];
}