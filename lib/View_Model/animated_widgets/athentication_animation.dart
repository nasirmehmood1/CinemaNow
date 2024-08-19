import 'package:flutter/material.dart';
import 'package:flutter_movie_ticketing_app/View/screens/ticket_screen.dart';

class FingerprintIcon extends StatefulWidget {
  @override
  _FingerprintIconState createState() => _FingerprintIconState();
}

class _FingerprintIconState extends State<FingerprintIcon> {
  Color _iconColor = Colors.white;
  bool _isClicked = false;
  bool _showCheckMark = false;
  bool _showFingerprint = true;

  void _toggleColor() {
    setState(() {
      _isClicked = !_isClicked;
      _iconColor = _isClicked ? Colors.red : Colors.white;
      if (_isClicked) {
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _showCheckMark = true;
            _showFingerprint = false;
            Navigator.pop(context);
          });
        });
      } else {
        _showCheckMark = false;
        _showFingerprint = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedOpacity(
            opacity: _showFingerprint ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            child: Icon(
              Icons.fingerprint,
              color: _iconColor,
              size: 100,
            ),
          ),
          AnimatedOpacity(
            opacity: _showCheckMark ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: const Icon(
              Icons.check,
              color: Colors.green,
              size: 100,
            ),
          ),
        ],
      ),
    );
  }
}
