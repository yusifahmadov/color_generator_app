import 'package:color_generator_app/core/response/responsei.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class ColorRepository {
  Future<Either<ResponseI, Color>> getRandomColor();
}
