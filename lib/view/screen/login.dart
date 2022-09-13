import 'package:defi_app/res/colors.dart';
import 'package:defi_app/view/widget/gradient_background.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: const [
                GradientContainer(
                  heightRatio: 0.5,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Sign Up for free',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      )),
                ),
              ],
            )
          ],
        ));
  }
}
