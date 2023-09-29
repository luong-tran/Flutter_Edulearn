import '../../../../../untils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../untils/colors.dart';
import '../widgets/payment_widgets.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Container(
          padding: const EdgeInsets.only(top: 100),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Center(
                child: Column(children: [
                  Image.asset('assets/images/payment_success.png',
                      width: 300, height: 300),
                  buildHeadTitle('Payment successful!'),
                  const Text(
                    'You have successfully made the class payment',
                    style: AppTextStyles.bodyTextRegular,
                  )
                ]),
              ),
              Positioned(
                  bottom: 40.h,
                  left: 0, // Align to the left edge
                  right: 0,
                  child: buildButtonSuccess(context))
            ],
          ),
        ));
  }
}
