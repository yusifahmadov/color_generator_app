import 'package:color_generator_app/features/color/data/datasources/color_local_data_source.dart';
import 'package:color_generator_app/features/color/data/repositories/color_repository_impl.dart';
import 'package:color_generator_app/features/color/domain/repositories/color_repository.dart';
import 'package:color_generator_app/features/color/domain/usecases/get_random_color.dart';
import 'package:color_generator_app/features/color/presentation/cubit/cubit/color_cubit.dart';
import 'package:color_generator_app/features/quote/data/datasources/quote_remote_data_source.dart';
import 'package:color_generator_app/features/quote/data/repositories/quote_repository_impl.dart';
import 'package:color_generator_app/features/quote/domain/repositories/quote_repository.dart';
import 'package:color_generator_app/features/quote/domain/usecases/get_random_quote.dart';
import 'package:color_generator_app/features/quote/presentation/cubit/quote_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

/// GetIt instance
final GetIt getIt = GetIt.instance;

/// Initialize getIt
Future<void> init() async {
  loadCubits();
  loadRepositories();
  loadExternals();
  loadUseCases();
  loadDataSources();
}

/// Load Cubits
void loadCubits() {
  getIt.registerFactory(() => ColorCubit(getIt()));
  getIt.registerFactory(() => QuoteCubit(getIt()));
}

/// Load Repositories
void loadRepositories() {
  getIt.registerLazySingleton<ColorRepository>(
    () => ColorRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<QuoteRepository>(
    () => QuoteRepositoryImpl(getIt()),
  );
}

/// Load Data Sources
void loadDataSources() {
  getIt.registerLazySingleton<ColorLocalDataSource>(
    ColorLocalDataSourceImpl.new,
  );
  getIt.registerLazySingleton<QuoteRemoteDataSource>(
    () => QuoteRemoteDataSourceImpl(getIt()),
  );
}

/// Load Use Cases
void loadUseCases() {
  getIt.registerLazySingleton(() => GetRandomColor(getIt()));
  getIt.registerLazySingleton(() => GetRandomQuote(getIt()));
}

/// Load Externals
void loadExternals() {
  getIt.registerLazySingleton(Dio.new);
}
