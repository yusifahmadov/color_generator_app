import 'package:bloc/bloc.dart';
import 'package:color_generator_app/core/response/responsei.dart';
import 'package:color_generator_app/core/usecase/no_params.dart';
import 'package:color_generator_app/features/quote/domain/entities/quote.dart';
import 'package:color_generator_app/features/quote/domain/usecases/get_random_quote.dart';

part 'quote_state.dart';

/// Quote Cubit
class QuoteCubit extends Cubit<QuoteState> {
  final GetRandomQuote _getRandomQuote;

  QuoteCubit(this._getRandomQuote) : super(QuoteInitial());

  /// Calls [_getRandomQuote] to get a response
  Future<void> getRandomQuote() async {
    final response = await _getRandomQuote(NoParams());
    response.fold(
      (l) => emit(RandomQuoteFailed(data: l)),
      (r) => emit(RandomQuoteLoaded(quote: r)),
    );
  }
}
