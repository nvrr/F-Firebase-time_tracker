import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';
import 'home_page.dart';
import 'sign_in/sign_in_page.dart';

class LandingPage extends StatefulWidget {
  final AuthBase auth;
  const LandingPage({Key key, @required this.auth}) : super(key: key);
  
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  User _user;

  @override
  void initState() {
    super.initState();
    _updateUser(widget.auth.currentUser);
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: widget.auth.authStateChanges(),
      builder:(context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active){
          final User user = snapshot.data;
          if (user == null) {
            return SignInPage(
              auth: widget.auth,
              onSignIn: _updateUser,
            );
          }
          return HomePage(
            auth: widget.auth,
            onSignOut: () => _updateUser(null),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    );
  }
}