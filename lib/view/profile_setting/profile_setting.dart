import 'package:flutter/material.dart';
import 'package:with_eat/view/home/home_page.dart';
import 'package:with_eat/view/profile_setting/nickname_text_field.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nicknameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("프로필 설정하기"), automaticallyImplyLeading: false),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("프로필 사진"),
              Icon(Icons.person, size: 90),
              SizedBox(height: 20),
              NicknameTextField(controller: _nicknameController),
              SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: () {
                  // UpdateGps(),
                  // if //현재위치가 불러와 지면 스낵바로 "현재 위치를 가져왔습니다" 팝, 데이터베이스에 저장
                },
                child: Text("현재 위치 가져오기"),
              ),
              SizedBox(height: 200),
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
    );
  }
}
