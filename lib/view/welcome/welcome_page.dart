import 'package:flutter/material.dart';
import 'package:with_eat/view/welcome/text_field_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF4EE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              SizedBox(height: 100),
              Icon(Icons.rice_bowl, size: 200, color: Colors.black),
              SizedBox(height: 60),
              LoginTextField(hintText: "아이디"),
              SizedBox(height: 20),
              LoginTextField(hintText: "비밀번호"),
              SizedBox(height: 10),
              Align(alignment: Alignment.centerRight, child: Text("회원가입")),
              SizedBox(height: 80),
              Text("SNS 계정으로 시작하기"),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, size: 70),
                  Icon(Icons.circle, size: 70),
                  Icon(Icons.circle, size: 70),
                  Icon(Icons.circle, size: 70),
                  Icon(Icons.circle, size: 70),
                ],
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () {},
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
    );
  }
}
