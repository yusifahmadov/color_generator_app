import 'package:color_generator_app/core/constants/constant.dart';
import 'package:color_generator_app/features/quote/data/models/quote_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'quote_remote_data_source.g.dart';

/// [QuoteRemoteDataSource] - contains abstract functions about the quote
abstract class QuoteRemoteDataSource {
  /// [getRandomQuote] - calls to api to get a random quote
  Future<QuoteModel> getRandomQuote();
}

@RestApi(baseUrl: QUOTE_BASE_URL)

/// Contains functions that overriden from [QuoteRemoteDataSource]
abstract class QuoteRemoteDataSourceImpl implements QuoteRemoteDataSource {
  /// return [_QuoteRemoteDataSourceImpl] existing instance
  factory QuoteRemoteDataSourceImpl(Dio dio) = _QuoteRemoteDataSourceImpl;

  @override
  @GET("/random")
  Future<QuoteModel> getRandomQuote();
}
