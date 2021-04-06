import 'package:flutter/material.dart';
import 'package:wtt_test_task/widgets/auth/social_auth_button.dart';

enum SocialAuthMethod {
  SignUp,
  LogIn,
}

class SocialAuthButtonList extends StatelessWidget {
  SocialAuthButtonList({
    Key key,
    @required this.authMethod,
  }) : super(key: key);

  final SocialAuthMethod authMethod;

  @override
  Widget build(BuildContext context) {
    String authMethodLabel;
    switch (authMethod) {
      case SocialAuthMethod.SignUp:
        authMethodLabel = 'Sign up';
        break;
      case SocialAuthMethod.LogIn:
        authMethodLabel = 'Log in';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SocialAuthButton(
          iconPath: 'assets/icons/social/facebook_icon.svg',
          authMethodLabel: authMethodLabel,
          socialNetworkName: 'Facebook',
          onPressed: () {},
        ),
        SizedBox(height: 18,),
        SocialAuthButton(
          iconPath: 'assets/icons/social/google_icon.svg',
          authMethodLabel: authMethodLabel,
          socialNetworkName: 'Google',
          onPressed: () {},
        ),
        SizedBox(height: 18,),
        SocialAuthButton(
          iconPath: 'assets/icons/social/instagram_icon.png',
          authMethodLabel: authMethodLabel,
          socialNetworkName: 'Instagram',
          onPressed: () {},
        ),
      ],
    );
  }
}
