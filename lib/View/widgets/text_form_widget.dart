import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({super.key, required this.hint, required this.icon});
  final String hint;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Container(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: TextField(
          cursorColor: Colors.black,
          style: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 11,
          ),
          decoration: InputDecoration(
              iconColor: Colors.amber.shade200,
              filled: true,
              fillColor: Colors.white,
              focusColor: Colors.blueAccent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(width * 0.1),
              ),
              labelText: hint,
              labelStyle: const TextStyle(fontSize: 12),
              icon: Icon(
                icon,
                size: 20,
              )),
        ));
  }
}
