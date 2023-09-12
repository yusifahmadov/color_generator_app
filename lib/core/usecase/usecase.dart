import 'package:color_generator_app/core/response/responsei.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, A> {
  Future<Either<ResponseI, T>> call(A params);
}
