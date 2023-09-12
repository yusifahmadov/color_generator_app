part of 'quote_cubit.dart';

sealed class QuoteState {
  const QuoteState();
}

final class QuoteInitial extends QuoteState {}

final class RandomQuoteLoaded extends QuoteState {
  final Quote quote;
  const RandomQuoteLoaded({required this.quote});
}

final class RandomQuoteFailed extends QuoteState {
  final ResponseI data;
  const RandomQuoteFailed({required this.data});
}

final class RandomQuoteLoading extends QuoteState {}
