import 'package:color_generator_app/core/response/responsei.dart';
import 'package:color_generator_app/features/quote/domain/entities/quote.dart';
import 'package:dartz/dartz.dart';

abstract class QuoteRepository {
  Future<Either<ResponseI, Quote>> getRandomQuote();
}
