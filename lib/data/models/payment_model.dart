class Discount {
  final int id;
  final String title;

  const Discount({required this.id, required this.title});
}

const List<Discount> listDiscount = <Discount>[
  Discount(id: 1, title: '5'),
  Discount(id: 2, title: '15'),
  Discount(id: 3, title: '20'),
  Discount(id: 4, title: '30'),
  Discount(id: 5, title: '50'),
  Discount(id: 6, title: '70'),
  Discount(id: 7, title: '80'),
  Discount(id: 8, title: '100'),
];

class ReferralCode {
  final int id;
  final String code;

  const ReferralCode({required this.id, required this.code});
}

const List<ReferralCode> listCode = <ReferralCode>[
  ReferralCode(id: 1, code: 'WHSUEO'),
  ReferralCode(id: 2, code: 'WHSUEW'),
  ReferralCode(id: 3, code: 'WHSEQE'),
  ReferralCode(id: 4, code: 'WHSYJI'),
];

class Payment {
  final int id;
  final String title;
  final String image;

  const Payment({required this.id, required this.title, required this.image});
}

const List<Payment> listPayment = <Payment>[
  Payment(id: 1, title: 'ShopeePay', image: "shopeepay"),
  Payment(id: 2, title: 'ZaloPay', image: "zalopay"),
  Payment(id: 3, title: 'Momo', image: "momo"),
  Payment(id: 4, title: 'ViettelPay', image: "viettelpay"),
];
