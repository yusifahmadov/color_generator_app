import 'package:color_generator_app/core/response/responsei.dart';
import 'package:color_generator_app/core/usecase/no_params.dart';
import 'package:color_generator_app/core/usecase/usecase.dart';
import 'package:color_generator_app/features/color/domain/repositories/color_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class GetRandomColor extends UseCase<Color, NoParams> {
  final ColorRepository _colorRepository;
  GetRandomColor(this._colorRepository);
  @override
  Future<Either<ResponseI, Color>> call(NoParams params) {
    return _colorRepository.getRandomColor();
  }
}
