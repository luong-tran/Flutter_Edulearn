import 'package:flutter_bloc/flutter_bloc.dart';

import 'payment_event.dart';
import 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvents, PaymentStates> {
  PaymentBloc() : super(const PaymentStates()) {
    on<OnDiscountEvent>(((event, emit) {
      emit(OnDiscountState(discount: event.discount));
    }));

    on<OnCodeEvent>(((event, emit) {
      emit(OnCodeState(code: event.code));
    }));
  }
}
