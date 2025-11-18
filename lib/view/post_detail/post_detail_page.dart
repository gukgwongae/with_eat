import 'package:flutter/material.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_app_bar.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_bottom_bar.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_image.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_info.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_map.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_user_information.dart';
import '../../model/post_detail/post_detail.dart';

class PostDetailPage extends StatefulWidget {
  final PostDetail detail;

  const PostDetailPage({super.key, required this.detail});

  // 일단 여기 더미에 있는 정보들로 디테일 페이지 구성
  PostDetailPage.dummy({super.key})
    : detail = PostDetail(
        postid: '1',
        hostId: 'testUser123',
        hostNickname: '테스트 유저',
        hostProfileImage: '',
        postTitle: '삼겹살 먹으러 갈 사람~',
        description: '제가 쏘겠습니다.\n선착순~~~',
        restName: '하남돼지 사당점',
        images: [
          'https://cdn.pixabay.com/photo/2020/11/11/03/26/pork-belly-5731404_1280.jpg',
        ],
        // 여기 전달 받은 날짜 값으로 입력되도록 수정 필요.
        reservedAt: DateTime.now(),
        chatroomId: 'chat123',
        location: Location(
          lat: 37.5665,
          lng: 126.9780,
          address: '서울 서초구 방배천로2길 15 1층',
        ),
      );

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final detail = widget.detail;

    return Scaffold(
      appBar: const DetailAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserSection(
              hostId: detail.hostId,
              hostProfileImage: detail.hostProfileImage,
            ),
            ImageSection(images: detail.images.first),
            InfoSection(
              reservedAt: detail.reservedAt,
              postTitle: detail.postTitle,
              description: detail.description,
              restName: detail.restName,
            ),
            MapSection(location: detail.location),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarSection(
        isFavorite: isFavorite,
        onChat: () {
        },
        onFavorite: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}
