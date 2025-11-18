//## 매칭 글 등록 화면입니다.
import 'package:flutter/material.dart';
import 'package:with_eat/view/add_post/widgets/add_post_display_view.dart';

class AddDetail {
  String title = "";
  String restName = "";
  String description = "";
  List<String> images = [];
  DateTime reservedAt = DateTime.now();
}

class AddPost extends StatefulWidget {
  AddPost({super.key});
  final titleController = TextEditingController();
  final desController = TextEditingController();
  final restNameController = TextEditingController();
  @override
  State<AddPost> createState() => _AddPostState();
}

//## 유효성 체크 문구
class _AddPostState extends State<AddPost> {
  void vaildcheck(String title, String restName, String des) {
    try {
      if (title.isEmpty) {
        showToast(context, '제목을 입력해 주세요');
        return;
      }
      if (restName.isEmpty) {
        showToast(context, '가게 이름을 입력해 주세요');
        return;
      }
      if (des.isEmpty) {
        showToast(context, '설명을 입력해 주세요');
        return;
      }
    } catch (e) {
      // print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //## 빈 화면을 터치하면 키보드 제거
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        //## 앱바
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context); //## 이전 페이지로 이동
            },
          ),
          title: Text("등록"),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: AddPostDisplayView(
                  titleController: widget.titleController,
                  restNameController: widget.restNameController,
                  desController: widget.desController,
                ),
              ),
            ),
          ),
        ),
        //## 저장 버튼
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 40,
          ),
          child: ElevatedButton(
            onPressed: () {
              // 저장 로직
              String title = widget.titleController.text.toString();
              String des = widget.desController.text.toString();
              String restName = widget.restNameController.text.toString();
              //##List<String> images = 별도 정의 필요

              //유효성 체크 함수
              vaildcheck(title, restName, des);
              AddDetail data = AddDetail();
              data.title = title;
              data.description = des;
              data.restName = restName;
              Navigator.pop(context, data);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 54),
              backgroundColor: Color(0xFFFF4500),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              '저장',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ## 유효성 체크 토스트 팝업
void showToast(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.black54,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating, // 필수! margin 적용하려면 필요
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    ),
  );
}
