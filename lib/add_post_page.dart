//## 매칭 글 등록 화면입니다.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  static const int _maxImages = 10;
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _selectedImages = [];
  bool _isSubmitting = false;

  bool _validCheck(String title, String restName, String des) {
    if (title.isEmpty) {
      showToast(context, '제목을 입력해 주세요');
      return false;
    }
    if (restName.isEmpty) {
      showToast(context, '가게 이름을 입력해 주세요');
      return false;
    }
    if (des.isEmpty) {
      showToast(context, '설명을 입력해 주세요');
      return false;
    }
    return true;
  }

  Future<void> _pickImages() async {
    try {
      final remaining = _maxImages - _selectedImages.length;
      if (remaining <= 0) {
        showToast(context, '사진은 최대 $_maxImages장까지 등록 가능합니다.');
        return;
      }
      final picked = await _picker.pickMultiImage(
        maxWidth: 1280,
        imageQuality: 80,
      );
      if (picked.isEmpty) return;
      setState(() {
        _selectedImages.addAll(picked.take(remaining));
      });
    } catch (e) {
      showToast(context, '사진을 불러오지 못했습니다. 다시 시도해 주세요.');
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  Future<void> _handleSubmit() async {
    final title = widget.titleController.text.trim();
    final restName = widget.restNameController.text.trim();
    final des = widget.desController.text.trim();

    if (!_validCheck(title, restName, des)) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      final data = AddDetail()
        ..title = title
        ..restName = restName
        ..description = des
        ..images = _selectedImages.map((file) => file.path).toList();
      if (!mounted) return;
      Navigator.pop(context, data);
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
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
                child: _buildForm(),
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
            onPressed: _isSubmitting ? null : _handleSubmit,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 54),
              backgroundColor: Color(0xFFFF4500),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: _isSubmitting
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
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

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImagePickerSection(),
        SizedBox(height: 30),
        titleLabel("제목"),
        SizedBox(height: 5),
        TextField(
          controller: widget.titleController,
          maxLength: 30,
          maxLines: 1,
          decoration: styleInputDecoration().copyWith(hintText: '삼겹살 같이 먹어요~'),
        ),
        SizedBox(height: 30),
        titleLabel("가게 이름"),
        SizedBox(height: 5),
        TextField(
          controller: widget.restNameController,
          maxLength: 30,
          maxLines: 1,
          decoration: styleInputDecoration().copyWith(hintText: '하남돼지 방배역점'),
        ),
        SizedBox(height: 30),
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text('지도 영역')),
        ),
        SizedBox(height: 30),
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text('일정 선택 영역')),
        ),
        SizedBox(height: 30),
        titleLabel("설명"),
        SizedBox(height: 5),
        TextField(
          controller: widget.desController,
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

  Widget _buildImagePickerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleLabel("사진 등록(${_selectedImages.length}/$_maxImages)"),
        const SizedBox(height: 8),
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _selectedImages.length + 1,
            itemBuilder: (context, index) {
              if (index == _selectedImages.length) {
                return _buildAddImageButton();
              }
              final file = _selectedImages[index];
              return _buildImageTile(file, index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAddImageButton() {
    return GestureDetector(
      onTap: _pickImages,
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: const Icon(Icons.camera_alt_rounded, color: Colors.black45),
      ),
    );
  }

  Widget _buildImageTile(XFile file, int index) {
    return Stack(
      children: [
        Container(
          width: 80,
          height: 80,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: FileImage(File(file.path)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 16,
          child: GestureDetector(
            onTap: () => _removeImage(index),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(2),
              child: const Icon(Icons.close, size: 14, color: Colors.white),
            ),
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
    // contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
    // ## 포커스가 없을 때 (기본) 테두리 색상
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black12, width: 2),
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
