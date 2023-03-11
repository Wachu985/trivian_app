import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:trivian_app/src/core/environment/environment_global.dart';
import 'package:trivian_app/src/features/trivian/presentation/bloc/trivian_bloc.dart';
import '../../features/trivian/domain/domain.dart';
import '../../features/trivian/data/data.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<ITrivianRepository>(() => TrivianRepository(
      datasource: DioDatasource(client: Dio(), url: EnvironmentGlobal.apiUrl)));

  getIt.registerLazySingleton<GetNumber>(
      () => GetNumber(repository: getIt<ITrivianRepository>()));
  getIt.registerLazySingleton<GetRandom>(
      () => GetRandom(repository: getIt<ITrivianRepository>()));

  getIt.registerLazySingleton<TrivianBloc>(() => TrivianBloc(
      getNumber: getIt<GetNumber>(), getRandom: getIt<GetRandom>()));
}
