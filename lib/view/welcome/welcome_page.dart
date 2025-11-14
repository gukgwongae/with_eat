import 'package:flutter/material.dart';
import 'package:with_eat/view/home/home_page.dart';
import 'package:with_eat/view/login_kakao/login_kakao.dart';
import 'package:with_eat/core/validator_util.dart';
import 'package:with_eat/view/welcome/id_text_field.dart';
import 'package:with_eat/view/welcome/pw_text_field.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController idController = TextEditingController();
    final TextEditingController pwController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFFBF4EE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 100),
                Icon(Icons.rice_bowl, size: 200, color: Colors.black),
                SizedBox(height: 20),
                IdTextField(
                  controller: idController,
                  validator: ValidatorUtil.validatorId,
                ),
                SizedBox(height: 20),
                PwTextField(
                  controller: pwController,
                  validator: ValidatorUtil.validatorPassword,
                ),
                SizedBox(height: 10),
                Align(alignment: Alignment.centerRight, child: Text("회원가입")),
                SizedBox(height: 80),
                Text("SNS 계정으로 시작하기"),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _circleImage('assets/logos/apple.png'),
                    SizedBox(width: 20),
                    _circleImage('assets/logos/facebook.jpeg'),
                    SizedBox(width: 20),
                    _circleImage('assets/logos/google.png'),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginKakao()),
                        );
                      },
                      child: _circleImage('assets/logos/kakao.png'),
                    ),
                    SizedBox(width: 20),
                    _circleImage('assets/logos/naver.png'),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("시작하기"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _circleImage(String assetPath) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(shape: BoxShape.circle),
    child: ClipOval(
      child: Image.asset(assetPath, fit: BoxFit.cover, width: 70, height: 70),
    ),
  );
}
