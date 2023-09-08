class PaymentStates {
  const PaymentStates();
}

class OnDiscountState extends PaymentStates {
  String discount;
  OnDiscountState({required this.discount});
}

class OnCodeState extends PaymentStates {
  String code;
  OnCodeState({required this.code});
}
