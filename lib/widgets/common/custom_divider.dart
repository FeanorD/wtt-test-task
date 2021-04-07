import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  CustomDivider({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  Widget _buildLine() {
    return Expanded(
      child: Container(
        height: 3,
        color: Color(0xFFEBEBEB),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildLine(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text,
            style: TextStyle(
              color: Color(0xFFEBEBEB),
              fontSize: 18,
            ),
          ),
        ),
        _buildLine(),
      ],
    );
  }
}
