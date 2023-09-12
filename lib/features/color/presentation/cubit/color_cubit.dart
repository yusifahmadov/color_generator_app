import 'dart:ui';

import 'package:color_generator_app/core/response/responsei.dart';
import 'package:color_generator_app/core/usecase/no_params.dart';
import 'package:color_generator_app/features/color/domain/usecases/get_random_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  final GetRandomColor _getRandomColor;
  ColorCubit(this._getRandomColor) : super(ColorInitial());

  getRandomColor() async {
    final response = await _getRandomColor(NoParams());

    response.fold(
      (l) => emit(RandomColorFailed(data: l)),
      (r) => emit(RandomColorLoaded(color: r)),
    );
  }
}
