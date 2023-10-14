import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'app/pages/profile/data/data_sources/profile_api_service.dart';
import 'app/pages/profile/data/repository/profile_repository_impl.dart';
import 'app/pages/profile/domain/repos/profile_respository.dart';
import 'app/pages/profile/domain/usecases/sign_out.dart';
import 'app/pages/profile/presentation/bloc/profile_bloc.dart';
import 'app/pages/signin/data/data_sources/sign_in_api_service.dart';
import 'app/pages/signin/data/repository/sign_in_repository_iml.dart';
import 'app/pages/signin/domain/repository/sign_in_respository.dart';
import 'app/pages/signin/domain/usecases/sign_in.dart';
import 'app/pages/signin/presentation/bloc/signin_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  // SignIn
  sl.registerSingleton<SignInApiService>(SignInApiService(sl()));
  sl.registerSingleton<SignInRepository>(SignInRepositoryImpl(sl()));
  sl.registerSingleton<SignInUseCase>(SignInUseCase(sl()));

  sl.registerFactory<SignInBloc>(() => SignInBloc(sl()));

  // Profile
  sl.registerSingleton<ProfileApiService>(ProfileApiService(sl()));
  sl.registerSingleton<ProfileRepository>(ProfileRepositoryImpl(sl()));
  sl.registerSingleton<SignOutUseCase>(SignOutUseCase(sl()));

  sl.registerFactory<ProfileBloc>(() => ProfileBloc(sl()));
}
