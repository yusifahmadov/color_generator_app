import 'package:color_generator_app/core/constants/constant.dart';
import 'package:color_generator_app/features/color/presentation/cubit/cubit/color_cubit.dart';
import 'package:color_generator_app/features/quote/presentation/cubit/quote_cubit.dart';
import 'package:color_generator_app/features/quote/presentation/widgets/quote_block.dart';
import 'package:color_generator_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Color Page
class ColorPageView extends StatefulWidget {
  ///
  const ColorPageView({super.key});

  @override
  State<ColorPageView> createState() => _ColorPageViewState();
}

class _ColorPageViewState extends State<ColorPageView> {
  final ColorCubit colorCubit = getIt<ColorCubit>();
  final QuoteCubit quoteCubit = getIt<QuoteCubit>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await colorCubit.getRandomColor();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ColorCubit, ColorState>(
        bloc: colorCubit,
        builder: (context, state) {
          if (state is RandomColorFailed) {
            return const Center(
              child: Text("Failed"),
            );
          } else if (state is RandomColorLoaded) {
            return GestureDetector(
              onTap: () async {
                await quoteCubit.getRandomQuote();
                colorCubit.getRandomColor();
              },
              child: Stack(
                children: [
                  ColoredBox(
                    color: state.color,
                    child: const Center(
                      child: Text(
                        'Hello There',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: n50,
                    child: QuoteBlock(quoteCubit: quoteCubit),
                  ),
                ],
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
