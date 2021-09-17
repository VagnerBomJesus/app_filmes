import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/background.png',
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
          ),
          Padding(
            padding: EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Image.asset("assets/images/logo.png"),
                SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: Get.width * .9,
                  height: 45,
                  child: SignInButton(
                    Buttons.Google,
                    onPressed: () {},
                    text: 'Entar com o Google',
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Sizedbox {}
