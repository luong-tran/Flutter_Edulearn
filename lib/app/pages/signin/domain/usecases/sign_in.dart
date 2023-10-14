import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../data/models/user_model.dart';
import '../entities/sign_in_entity.dart';
import '../repository/sign_in_respository.dart';

class SignInUseCase implements UseCase<void, SignInRequire> {
  final SignInRepository _signInRepository;

  SignInUseCase(this._signInRepository);

  @override
  Future<DataState<SignInEntity>> call({SignInRequire? params}) {
    return _signInRepository.signInResponse(params!);
  }
}
