import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/text_form_widget.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.3,
      width: width,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.07,
            width: width * 0.8,
            child: const TextFormWidget(
              hint: 'Card Holder',
              icon: Icons.person_2_rounded,
            ),
          ),
          SizedBox(
              height: height * 0.07,
              width: width * 0.8,
              child: const TextFormWidget(
                  hint: 'Card N0 ', icon: Icons.card_giftcard_rounded)),
          Row(
            children: [
              SizedBox(
                height: height * 0.07,
                width: width * 0.5,
                child: const TextFormWidget(
                  hint: 'Valid ',
                  icon: Icons.calendar_month,
                ),
              ),
              SizedBox(
                  height: height * 0.07,
                  width: width * 0.5,
                  child: const TextFormWidget(
                      hint: 'CVC', icon: Icons.password_rounded)),
            ],
          )
        ],
      ),
    );
  }
}
