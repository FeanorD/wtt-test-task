import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialAuthButton extends StatelessWidget {
  SocialAuthButton({
    Key key,
    @required this.iconPath,
    @required this.authMethodLabel,
    @required this.socialNetworkName,
    @required this.onPressed,
  }) : super(key: key);

  final String iconPath;
  final String authMethodLabel;
  final String socialNetworkName;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    bool isSvgIcon = iconPath.endsWith('.svg');
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 4,
        primary: Colors.black,
      ),
      child: Row(
        children: [
          isSvgIcon
            ? SvgPicture.asset(
                iconPath,
                width: 25,
                height: 25,
              )
            : Image.asset(
                iconPath,
                width: 25,
                height: 25,
              ),
          Expanded(
            child: Text(
              '$authMethodLabel with $socialNetworkName',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
