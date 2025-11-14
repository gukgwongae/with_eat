//## 매칭 글 등록 화면입니다.
import 'package:flutter/material.dart';

class AddDetail {
  String title = "";
  String restName = "";
  String description = "";
  List<String> images = [];
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
                child: displayView(
                  widget.titleController,
                  widget.restNameController,
                  widget.desController,
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

Widget displayView(
  TextEditingController titleController,
  TextEditingController restNameController,
  TextEditingController desController,
) {
  return Column(
    children: [
      titleLabel("사진 등록(*/10)"),
      SizedBox(height: 5),
      GestureDetector(
        onTap: () {
          // 갤러리 열기
        },
        child: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
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
      ),
      SizedBox(height: 30),
      titleLabel("제목"),
      SizedBox(height: 5),
      TextField(
        controller: titleController,
        maxLength: 30,
        maxLines: 1,
        decoration: styleInputDecoration().copyWith(hintText: '삼겹살 같이 먹어요~'),
      ),
      SizedBox(height: 30),
      titleLabel("가게 이름"),
      SizedBox(height: 5),
      TextField(
        controller: restNameController,
        maxLength: 30,
        maxLines: 1,
        decoration: styleInputDecoration().copyWith(hintText: '하남돼지 방배역점'),
      ),
      SizedBox(height: 30),
      Container(
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text('지도 영역')),
      ),
      SizedBox(height: 30),
      Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text('일정 선택 영역')),
      ),
      SizedBox(height: 30),
      titleLabel("설명"),
      SizedBox(height: 5),
      TextField(
        controller: desController,
        maxLength: 1000,
        maxLines: 8,
        decoration: styleInputDecoration().copyWith(
          hintText: '결제 방법이나 기타 사항들을 적어주세요.\n예: 제가 쏘겠습니다. 선착순~~~',
        ),
      ),
      SizedBox(height: 30),
    ],
  );
}

// ## TextField 스타일 정의
InputDecoration styleInputDecoration() {
  return InputDecoration(
    counterText: '',
    // contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
    // ## 포커스가 없을 때 (기본) 테두리 색상
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2),
      borderRadius: BorderRadius.circular(10.0),
    ),
    // ## 포커스가 있을 때 (선택되었을 때) 테두리 색상
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black, // 포커스 색상
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

// ## 인풋창 라벨 스타일 정의
Widget titleLabel(String title) {
  return Align(alignment: Alignment.centerLeft, child: Text(title));
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
