import 'package:flutter/material.dart';
import 'package:time_tracker/common_widgets/form_submit_button.dart';

class EmailSignInForm extends StatelessWidget {

  List<Widget> _buildChildren() {
    return [
      TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'test@test.com',
        ),
      ),
      SizedBox(height: 8.0),
      TextField(
        decoration: InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
      ),
      SizedBox(height: 8.0),
      RaisedButton(
        child: Text('Sign in'),
        onPressed: () {},
      ),
      SizedBox(height: 8.0),
      FormSubmitButton(
        text: 'Need an account? Register',
        onPressed: () {},
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildChildren(),
      ),
    );
  }
}