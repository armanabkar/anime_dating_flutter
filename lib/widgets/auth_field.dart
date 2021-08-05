import 'package:anime_dating_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String placeholder;

  const AuthField({
    Key key,
    @required this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          labelText: placeholder,
        ),
      ),
    );
  }
}
