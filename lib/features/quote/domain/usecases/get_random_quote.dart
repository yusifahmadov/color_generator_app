import 'package:color_generator_app/core/response/responsei.dart';
import 'package:color_generator_app/core/usecase/no_params.dart';
import 'package:color_generator_app/core/usecase/usecase.dart';
import 'package:color_generator_app/features/quote/domain/entities/quote.dart';
import 'package:color_generator_app/features/quote/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomQuote extends UseCase<Quote, NoParams> {
  final QuoteRepository _quoteRepository;
  GetRandomQuote(this._quoteRepository);
  @override
  Future<Either<ResponseI, Quote>> call(NoParams params) async {
    return await _quoteRepository.getRandomQuote();
  }
}
