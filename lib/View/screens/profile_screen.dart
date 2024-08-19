import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String name = '/profileScreen';

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height,
      width: width,
      child: Center(
        child: CircleAvatar(
          maxRadius: 200,
          backgroundColor: Colors.deepPurple.shade100,
          backgroundImage: const AssetImage(
            'assets/images/nasir.jpeg',
          ),
        ),
      ),
    );
  }
}
