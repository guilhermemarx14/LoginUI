import 'package:flutter/material.dart';
import 'package:login_ui/home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48,
        child: Image.asset('assets/logo.jpg'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'guilhermemarx14@gmail.com',
      decoration: InputDecoration(
        hintText: 'e-mail',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'password',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: MaterialButton(
        shape: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(32),
        ),
        splashColor: Colors.transparent,
        elevation: 5,
        minWidth: 200,
        height: 42,
        color: Colors.lightBlueAccent,
        child: Text(
          'Log In',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.push(context, SlideRightRoute(page: HomePage()));
        },
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24, right: 24),
          children: [
            logo,
            SizedBox(height: 48),
            email,
            SizedBox(height: 8),
            password,
            SizedBox(height: 24),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
