import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatfirebasesampel/components/rounded_button.dart';
import 'package:chatfirebasesampel/screen/login_screen.dart';
import 'package:chatfirebasesampel/screen/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();

  static final String id = 'welcome_screen';
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'log',
                  child: Container(
                      child: Image.asset('images/logo.png'), height: 60.0),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              title: 'Log In',
              onPress: (){Navigator.pushNamed(context, LoginScreen.id);}),
            RoundedButton(
              color: Colors.blueAccent,
              title: 'Register',
              onPress: (){ Navigator.pushNamed(context, RegistrationScreen.id);},
            ),
          ],
        ),
      ),
    );
  }

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation =
        ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  Animation animation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
