import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecases/usecase.dart';
import '../entities/sign_out_entity.dart';
import '../repos/profile_respository.dart';

class SignOutUseCase implements UseCase<DataState<SignOutEntity>, void> {
  final ProfileRepository _profileRepository;

  SignOutUseCase(this._profileRepository);

  @override
  Future<DataState<SignOutEntity>> call({void params}) {
    return _profileRepository.signOutResponse();
  }
}
