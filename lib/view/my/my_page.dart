//## my page 화면입니다.

import 'package:flutter/material.dart';

class User {
  String id = "";
  String profileImageUrl = "";
  String nickname = "";
  String bestfood = "";
  String description = "";
}

class MyPage extends StatefulWidget {
  MyPage({super.key});
  final nicknameController = TextEditingController();
  final bestfoodController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  State<MyPage> createState() => _MyPageState();
}

//## 유효성 체크 문구
class _MyPageState extends State<MyPage> {
  bool _isEditMode = false; //## 수정 모드 상태 추가
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //## 앱바
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context); //## 이전 페이지로 이동
          },
        ),
        title: Text("MY"),
        //## 수정 or 저장 버튼
        actions: [
          TextButton(
            onPressed: () {
              if (_isEditMode) {
                print("저장 실행"); //##: isEditMode가 true일 때 저장 로직
              }
              setState(() {
                _isEditMode = !_isEditMode;
              });
            },
            child: Text(
              _isEditMode ? "저장" : "수정",
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      //## 바디
      body: Container(
        color: Colors.white,
        child: Scrollbar(
          thumbVisibility: false,
          trackVisibility: false,
          interactive: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: displayView(
                widget.nicknameController,
                widget.bestfoodController,
                widget.descriptionController,
                _isEditMode,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget displayView(
  TextEditingController nicknameController,
  TextEditingController bestfoodController,
  TextEditingController descriptionController,
  bool isEditMode,
) {
  return Column(
    children: [
      titleLabel("프로필 사진", center: true),
      SizedBox(height: 5),
      Align(
        alignment: Alignment.center,
        child: Container(
          width: 100,
          height: 100,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.camera_alt_rounded,
              color: Colors.black45,
              size: 24,
            ),
          ),
        ),
      ),
      SizedBox(height: 30),
      titleLabel("닉네임"),
      SizedBox(height: 5),
      TextField(
        controller: nicknameController,
        maxLength: 30,
        maxLines: 1,
        enabled: isEditMode,
        decoration: styleInputDecoration().copyWith(hintText: '고독한미식가'),
      ),
      SizedBox(height: 30),
      titleLabel("최애 음식"),
      SizedBox(height: 5),
      TextField(
        controller: bestfoodController,
        maxLength: 30,
        maxLines: 1,
        enabled: isEditMode,
        decoration: styleInputDecoration().copyWith(hintText: '삼겹살'),
      ),
      SizedBox(height: 30),
      titleLabel("자기소개"),
      SizedBox(height: 5),
      TextField(
        controller: descriptionController,
        maxLength: 1000,
        maxLines: 8,
        enabled: isEditMode,
        decoration: styleInputDecoration().copyWith(hintText: '삼겹살 러버'),
      ),
      SizedBox(height: 30),
    ],
  );
}

// ## TextField 스타일 정의
InputDecoration styleInputDecoration() {
  return InputDecoration(
    counterText: '',
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black12, width: 2),
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}

// ## 인풋창 라벨 스타일 정의
Widget titleLabel(String id, {bool center = false}) {
  return Align(
    alignment: center ? Alignment.center : Alignment.centerLeft,
    child: Text(id),
  );
}