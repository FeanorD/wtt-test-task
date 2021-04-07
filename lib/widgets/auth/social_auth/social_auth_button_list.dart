import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtt_test_task/blocs/auth/auth_bloc.dart';
import 'package:wtt_test_task/widgets/auth/social_auth/social_auth_button.dart';

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

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, _) {
        AuthBloc authBloc = context.read<AuthBloc>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SocialAuthButton(
              iconPath: 'assets/icons/social/facebook_icon.svg',
              authMethodLabel: authMethodLabel,
              socialNetworkName: 'Facebook',
              onPressed: () => authBloc.add(
                  SocialAuthRequested(socialNetwork: SocialNetwork.facebook)
              ),
            ),
            SizedBox(height: 18,),
            SocialAuthButton(
              iconPath: 'assets/icons/social/google_icon.svg',
              authMethodLabel: authMethodLabel,
              socialNetworkName: 'Google',
              onPressed: () => authBloc.add(
                  SocialAuthRequested(socialNetwork: SocialNetwork.google)
              ),
            ),
            SizedBox(height: 18,),
            SocialAuthButton(
              iconPath: 'assets/icons/social/instagram_icon.png',
              authMethodLabel: authMethodLabel,
              socialNetworkName: 'Instagram',
              onPressed: () => authBloc.add(
                  SocialAuthRequested(socialNetwork: SocialNetwork.instagram)
              ),
            ),
          ],
        );
      },
    );
  }
}
