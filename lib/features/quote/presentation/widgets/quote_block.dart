import 'package:color_generator_app/core/utility/custom_border_radius.dart';
import 'package:color_generator_app/features/quote/presentation/cubit/quote_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// QuoteBlock Widget
class QuoteBlock extends StatefulWidget {
  const QuoteBlock({required this.quoteCubit, super.key});

  /// QuoteCubit instance
  final QuoteCubit quoteCubit;

  @override
  State<QuoteBlock> createState() => _QuoteBlockState();
}

class _QuoteBlockState extends State<QuoteBlock> {
  @override
  void initState() {
    widget.quoteCubit.getRandomQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteCubit, QuoteState>(
      bloc: widget.quoteCubit,
      builder: (context, state) {
        if (state is RandomQuoteLoading) {
          return const CircularProgressIndicator();
        } else if (state is RandomQuoteFailed) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Text(state.data.message),
          );
        } else if (state is RandomQuoteLoaded) {
          const opacity = 0.2;
          const double blurRadius2 = 10;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: CustomBorderRadius.r12(),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(opacity),
                    blurRadius: blurRadius2,
                  ),
                ],
              ),
              child: Text("${state.quote.content} - ${state.quote.author}"),
            ),
          );
        }

        return Container();
      },
    );
  }
}
