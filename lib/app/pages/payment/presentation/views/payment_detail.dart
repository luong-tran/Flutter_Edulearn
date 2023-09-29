import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/wigets/common_widgets.dart';
import '../../../../../untils/texts.dart';
import '../../data/models/payment_model.dart';
import '../bloc/payment_event.dart';
import '../bloc/payment_state.dart';
import '../bloc/payment_bloc.dart';
import '../widgets/payment_widgets.dart';

class PaymentDetailPage extends StatefulWidget {
  const PaymentDetailPage({Key? key}) : super(key: key);

  @override
  State<PaymentDetailPage> createState() => _PaymentDetailPageState();
}

class _PaymentDetailPageState extends State<PaymentDetailPage> {
  late String selectedDiscount;
  late String selectedCode;
  late String selectedPayment;
  late double total;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDiscount = '';
    selectedCode = '';
    selectedPayment = '';
    total = 199;
  }

  void _onSelectedDiscount(String discount) {
    selectedDiscount = discount;
    total = total - 95.5;
  }

  void _onSelectedCode(String code) {
    selectedCode = code;
    total = total - 20;
  }

  void onSelectedPayment(String payment) {
    setState(() {
      selectedPayment = payment;
    });
  }

  void _emitState(PaymentStates state) {
    if (state is OnDiscountState) {
      _onSelectedDiscount(state.discount);
    }

    if (state is OnCodeState) {
      _onSelectedCode(state.code);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<PaymentBloc, PaymentStates>(
            listener: (context, state) {
      _emitState(state);
    }, builder: (context, state) {
      return Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HeaderBackApp(),
                          buildHeadTitle('Payment Detail'),
                          _buildUIDiscountAnVoucher(),
                          buildLine(),
                          _buildUIDetail(),
                          buildLine(),
                          _buildUITotal(),
                          SizedBox(
                            height: 110.h,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 40.h,
                  left: 0, // Align to the left edge
                  right: 0,
                  child: buildButton(
                      selectedCode.isNotEmpty &&
                          selectedDiscount.isNotEmpty &&
                          selectedPayment.isNotEmpty, () {
                    Navigator.of(context).pushNamed('/payment_success');
                  }))
            ],
          ));
    }));
  }

  Widget _buildUIDiscountAnVoucher() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle('Discount & voucher'),
        GestureListSheet(
          title: 'Discount',
          type: SheetType.typeOne,
          dynamicList: listDiscount,
          onChange: (value) {
            context.read<PaymentBloc>().add(OnDiscountEvent(value));
          },
        ),
        if (selectedDiscount.isEmpty)
          Container()
        else
          buildCardDiscount(selectedDiscount),
        GestureListSheet(
          title: 'Referral code',
          type: SheetType.typeOne,
          dynamicList: listCode,
          onChange: (value) {
            context.read<PaymentBloc>().add(OnCodeEvent(value));
          },
        ),
        if (selectedCode.isEmpty) Container() else buildCardCode(selectedCode),
        // _buildUIDiscountAnVoucher(),
        buildLine(),
        buildTitle('Payment method'),
        GestureListSheet(
          title: 'Payment',
          type: SheetType.typeTwo,
          dynamicList: listPayment,
          onChange: onSelectedPayment,
        ),
        if (selectedPayment.isEmpty)
          Container()
        else
          buildCardPayment(selectedPayment),
      ],
    );
  }

  Widget _buildUIDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle('Detail'),
        buildTextTile('Class price', 'Rp199.000'),
        buildTextTile(
            'Discount', selectedDiscount.isEmpty ? 'Rp0' : '-Rp99.500'),
        buildTextTile('Discount refferal code',
            selectedCode.isEmpty ? 'Rp0' : '-Rp20.000'),
      ],
    );
  }

  Widget _buildUITotal() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Sub total',
            style: AppTextStyles.titleCard,
          ),
          Text(
            'Rp' '$total' '00',
            style: AppTextStyles.titleCard,
          )
        ],
      ),
    );
  }
}
