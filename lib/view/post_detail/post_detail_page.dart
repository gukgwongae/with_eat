import 'package:flutter/material.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_app_bar.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_bottom_bar.dart';
// import 'package:with_eat/view/post_detail/widgets/post_detail_info.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_map.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_user_information.dart';
import '../../model/post_detail/post_detail.dart';

class PostDetailPage extends StatefulWidget {
  final PostDetail detail;

  const PostDetailPage({super.key, required this.detail});

  PostDetailPage.dummy({super.key})
    : detail = PostDetail(
        postid: '1',
        hostId: 'testUser123',
        hostNickname: '테스트 유저',
        hostProfileImage: '',
        postTitle: '삼겹살 먹으러 갈 사람~',
        description: '제가 쏘겠습니다.\n선착순~~~',
        // 욕심 내자면 지도에서 설정된 가게 이름이 표시되도록 하고,
        // 이미지는 가게에서 올려진 사진 끌어오기... 지금은 불가능하겠지?
        // 일단 글 추가 시 유저가 등록한 가게 이름과 사진으로 표시되록 하기!
        // 이미지는 여러 장 올리는 것으로 수정
        restName: '하남돼지 사당점',
        images: [
          'https://cdn.pixabay.com/photo/2020/11/11/03/26/pork-belly-5731404_1280.jpg',
        ],
        // 여기 전달 받은 날짜 값으로 입력되도록 수정 필요.
        reservedAt: DateTime.now(),
        chatroomId: 'chat123',
        // 지도 정보 전달 받아 지도 표시되도록 수정.
        // 여기도 Riverpod으로 변경해야 하겠지..?
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

            // pubspec.yaml에 intl 패키지 추가 후 사용.
            // ImageSection(images: detail.images.first),
            // InfoSection(
            //   reservedAt: detail.reservedAt,
            //   postTitle: detail.postTitle,
            //   description: detail.description,
            //   restName: detail.restName,
            // ),
            MapSection(location: detail.location),
          ],
        ),
      ),

      bottomNavigationBar: BottomBarSection(
        isFavorite: isFavorite,
        onChat: () {
          // 채팅방으로 이동하는 기능 추가할 것.
        },
        onFavorite: () {
          // 별 부분 riverpod으로 변경할 것.
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}
