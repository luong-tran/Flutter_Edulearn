abstract class PaymentEvents {
  const PaymentEvents();
}

class OnDiscountEvent extends PaymentEvents {
  final String discount;
  const OnDiscountEvent(this.discount);
}

class OnCodeEvent extends PaymentEvents {
  final String code;
  const OnCodeEvent(this.code);
}
