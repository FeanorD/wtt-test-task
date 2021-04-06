import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:wtt_test_task/widgets/auth/text_link.dart';

class LogInForm extends StatefulWidget {
  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  void _logIn() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            key: ValueKey('email'),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'example@some.com',
              prefixIcon: Icon(
                Icons.alternate_email,
                color:Color(0xFFB5B5B5),
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your email';
              } else if (!EmailValidator.validate(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onSaved: (value) {
              _email = value;
            },
          ),
          SizedBox(height: 16,),
          TextFormField(
            key: ValueKey('password'),
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFFB5B5B5),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 8) {
                return 'Password have to be at least 8 characters long';
              }
              return null;
            },
            onSaved: (value) {
              _password = value;
            },
          ),
          SizedBox(height: 16,),
//          Container(
//            width: double.infinity,
//            decoration: BoxDecoration(
//              gradient: LinearGradient(
//                begin: Alignment.topCenter,
//                end: Alignment.bottomCenter,
//                colors: [
//                  Color(0xFFFFA450),
//                  Color(0xFFE16C00),
//                ],
//              ),
//            ),
//            child: TextButton(
//              child: Text('Log in'),
//              onPressed: () {},
//            ),
//          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
            ),
            child: Ink(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFA450),
                    Color(0xFFE16C00),
                  ],
                ),
              ),
              child: Text(
                'Log in',
                textAlign: TextAlign.center,
              ),
            ),
            onPressed: _logIn,
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Forgot your password? '),
              TextLink(
                text: 'Click here',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
