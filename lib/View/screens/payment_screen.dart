import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/Model/booking_model.dart';
import 'package:flutter_movie_ticketing_app/View/utilities/ui_colour.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/bank_card.dart';
import 'package:flutter_movie_ticketing_app/View/widgets/payment_widget.dart';
import 'package:flutter_movie_ticketing_app/View_Model/animated_widgets/start_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  static const String name = '/paymentScreen';

  @override
  Widget build(BuildContext context) {
    late BookingModel bookingModel;
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null || args is! BookingModel) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('No movie details found.'),
        ),
      );
    }
    bookingModel = args;

    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: UiColour().paymentScreenBgOne,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.01),
        title: const Text(
          'Ticket Screen',
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                transform: const GradientRotation(2),
                colors: [
              UiColour().paymentScreenBgOne,
              UiColour().paymentScreenBgSecond
            ])),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
                height: height * 0.23,
                width: width * 0.8,
                child: const BankCard()),
            SizedBox(
              height: height * 0.06,
            ),
            ValueListenableBuilder(
              valueListenable: bookingModel.bookedSeatPrice,
              builder: (context, value, child) {
                return SizedBox(
                  child: Text(
                    "€$value ",
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
            SizedBox(
              height: height * 0.05,
            ),
            const PaymentWidget(),
            SizedBox(
              height: height * 0.01,
            ),
            StartButton(
                backgroundColour: Colors.blue.shade300,
                titleText: 'Verify',
                fontColour: Colors.white,
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
