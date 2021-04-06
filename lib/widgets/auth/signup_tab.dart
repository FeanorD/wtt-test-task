import 'package:flutter/material.dart';
import 'package:wtt_test_task/widgets/auth/custom_divider.dart';
import 'package:wtt_test_task/widgets/auth/social_auth_button_list.dart';
import 'package:wtt_test_task/widgets/auth/text_link.dart';

class SignUpTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SocialAuthButtonList(authMethod: SocialAuthMethod.SignUp),
          SizedBox(height: 18,),
          CustomDivider(text: 'Or',),
          SizedBox(height: 18,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 4,
              primary: Color(0xFFB6B6B6),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 9.5),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.alternate_email,
                  size: 30,
                ),
                Expanded(
                  child: Text(
                    'Sign up with Email',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          SizedBox(height: 14,),
          Column(
            children: [
              Text('Already have an account?'),
              TextLink(
                text: 'Click here',
                onTap: () {
                  print('test');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
