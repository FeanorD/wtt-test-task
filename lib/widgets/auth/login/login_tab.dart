import 'package:flutter/material.dart';
import 'package:wtt_test_task/widgets/auth/social_auth/social_auth_button_list.dart';
import 'package:wtt_test_task/widgets/common/custom_divider.dart';

import 'login_form.dart';

class LogInTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SocialAuthButtonList(authMethod: SocialAuthMethod.LogIn),
          SizedBox(height: 18,),
          CustomDivider(text: 'Or',),
          SizedBox(height: 18,),
          LogInForm(),
        ],
      ),
    );
  }
}
