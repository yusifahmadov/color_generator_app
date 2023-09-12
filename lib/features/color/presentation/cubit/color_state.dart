part of 'color_cubit.dart';

sealed class ColorState {}

final class ColorInitial extends ColorState {}

final class RandomColorLoaded extends ColorState {
  final Color color;
  RandomColorLoaded({required this.color});
}

final class RandomColorFailed extends ColorState {
  final ResponseI data;
  RandomColorFailed({required this.data});
}
