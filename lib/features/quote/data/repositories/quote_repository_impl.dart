import 'package:color_generator_app/core/response/responsei.dart';
import 'package:color_generator_app/features/quote/data/datasources/quote_remote_data_source.dart';
import 'package:color_generator_app/features/quote/domain/entities/quote.dart';
import 'package:color_generator_app/features/quote/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

///
class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteRemoteDataSource _quoteRemoteDataSource;
  QuoteRepositoryImpl(this._quoteRemoteDataSource);
  @override
  Future<Either<ResponseI, Quote>> getRandomQuote() async {
    try {
      return Right(await _quoteRemoteDataSource.getRandomQuote());
    } on DioException catch (e) {
      return Left(
        ResponseI(
          message: e.response != null ? e.response.toString() : "500 Error",
        ),
      );
    }
  }
}
