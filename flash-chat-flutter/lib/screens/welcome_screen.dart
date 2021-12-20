import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/custom_button.dart';

class WelcomeScreen extends StatefulWidget {

  static const String id = 'welcome';


  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin{

  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(_controller);

    _controller.forward();

    _controller.addListener(() {
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.w900,
                    color: Colors.black,
                ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Flash Chat'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            CustomButton(
              color: Colors.lightBlueAccent,
              onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
              },
              buttonText: 'Log In',
            ),
            CustomButton(
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              buttonText: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}