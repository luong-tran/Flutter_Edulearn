import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardBloc extends Bloc<OnboardEvents, OnboardStates> {
  OnboardBloc() : super(OnboardStates()) {
    on<OnboardEvents>(((event, emit) {
      emit(OnboardStates(page: state.page));
    }));
  }
}
