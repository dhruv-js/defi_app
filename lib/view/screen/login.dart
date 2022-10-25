import 'package:defi_app/res/colors.dart';
import 'package:defi_app/view/widget/button.dart';
import 'package:defi_app/view/widget/gradient_background.dart';
import 'package:defi_app/view/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginScreen extends StatelessWidget {
  final form = FormGroup({
    'name': FormControl<String>(),
    'password': FormControl<String>(),
  });

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: const [
                  GradientContainer(
                    heightRatio: 0.5,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 24.0, horizontal: 36.0),
                    child: Text(
                      'Sign Up for free',
                      style: TextStyle(
                          color: iconColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ReactiveForm(
                formGroup: form,
                child: Column(
                  children: const [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        child: Textfield(
                          formControlName: 'name',
                          hint: 'Name',
                          icon: Icon(color: iconColor, Icons.person),
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: Textfield(
                        formControlName: 'password',
                        hint: 'Password',
                        icon: Icon(color: iconColor, Icons.lock),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: GradientButton(text: 'Sign up', callback: () {}),
            )
          ],
        ),
      ),
    );
  }
}
