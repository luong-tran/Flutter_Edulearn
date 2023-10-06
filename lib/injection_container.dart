import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'app/pages/signin/data/data_sources/sign_in_api_service.dart';
import 'app/pages/signin/data/repository/sign_in_repository_iml.dart';
import 'app/pages/signin/domain/repository/sign_in_respository.dart';
import 'app/pages/signin/domain/usecases/sign_in.dart';
import 'app/pages/signin/presentation/bloc/signin_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<SignInApiService>(SignInApiService(sl()));
  sl.registerSingleton<SignInRepository>(SignInRepositoryImpl(sl()));
  sl.registerSingleton<SignInUseCase>(SignInUseCase(sl()));

  sl.registerFactory<SignInBloc>(() => SignInBloc(sl()));
}
