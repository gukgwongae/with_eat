import 'package:flutter/material.dart';
import 'package:with_eat/view/add_post/widgets/add_post_input_decoration.dart';
import 'package:with_eat/view/add_post/widgets/add_post_title_label.dart';

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
        AddPostTitleLabel(title: "사진 등록(*/10)"),
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
        AddPostTitleLabel(title: "제목"),
        const SizedBox(height: 5),
        TextField(
          controller: titleController,
          maxLength: 30,
          maxLines: 1,
          decoration: styleInputDecoration(hintText: '삼겹살 같이 먹어요~'),
        ),
        const SizedBox(height: 30),
        AddPostTitleLabel(title: "가게 이름"),
        const SizedBox(height: 5),
        TextField(
          controller: restNameController,
          maxLength: 30,
          maxLines: 1,
          decoration: styleInputDecoration(hintText: '하남돼지 방배역점'),
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
        AddPostTitleLabel(title: "설명"),
        const SizedBox(height: 5),
        TextField(
          controller: desController,
          maxLength: 1000,
          maxLines: 8,
          decoration: styleInputDecoration(
            hintText: '결제 방법이나 기타 사항들을 적어주세요.\n예: 제가 쏘겠습니다. 선착순~~~',
          ),
        ),
      ],
    );
  }
}
