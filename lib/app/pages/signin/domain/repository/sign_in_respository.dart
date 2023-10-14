import '../../../../../core/resources/data_state.dart';
import '../../data/models/user_model.dart';
import '../entities/sign_in_entity.dart';

abstract class SignInRepository {
  // API methods
  Future<DataState<SignInEntity>> signInResponse(SignInRequire signInRequire);
}
