import 'package:flutter/material.dart';

class AddPostDisplayView extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController restNameController;
  final TextEditingController desController;

  const AddPostDisplayView({
    super.key,
    required this.titleController,
    required this.restNameController,
    required this.desController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleLabel("사진 등록(*/10)"),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            // 갤러리 열기
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.black45,
                size: 24,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        titleLabel("제목"),
        const SizedBox(height: 5),
        TextField(
          controller: titleController,
          maxLength: 30,
          maxLines: 1,
          decoration: styleInputDecoration().copyWith(hintText: '삼겹살 같이 먹어요~'),
        ),
        const SizedBox(height: 30),
        titleLabel("가게 이름"),
        const SizedBox(height: 5),
        TextField(
          controller: restNameController,
          maxLength: 30,
          maxLines: 1,
          decoration: styleInputDecoration().copyWith(hintText: '하남돼지 방배역점'),
        ),
        const SizedBox(height: 30),
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(child: Text('지도 영역')),
        ),
        const SizedBox(height: 30),
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(child: Text('일정 선택 영역')),
        ),
        const SizedBox(height: 30),
        titleLabel("설명"),
        const SizedBox(height: 5),
        TextField(
          controller: desController,
          maxLength: 1000,
          maxLines: 8,
          decoration: styleInputDecoration().copyWith(
            hintText: '결제 방법이나 기타 사항들을 적어주세요.\n예: 제가 쏘겠습니다. 선착순~~~',
          ),
        ),
      ],
    );
  }
}

// ## TextField 스타일 정의
InputDecoration styleInputDecoration() {
  return InputDecoration(
    counterText: '',
    // ## 포커스가 없을 때 (기본) 테두리 색상
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black12, width: 2),
      borderRadius: BorderRadius.circular(10.0),
    ),
    // ## 포커스가 있을 때 (선택되었을 때) 테두리 색상
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

// ## 인풋창 라벨 스타일 정의
Widget titleLabel(String title) {
  return Align(alignment: Alignment.centerLeft, child: Text(title));
}