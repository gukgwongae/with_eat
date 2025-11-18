import 'package:flutter/material.dart';
import 'package:with_eat/model/post_detail/post_detail.dart';
import 'package:with_eat/view/chat_detail/chat_detail_page.dart';
import 'package:with_eat/view/chat_detail/widgets/chat_detail_timeFormat.dart';

class ChatTabListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: 1,
        itemBuilder: (context, index) {
          return item();
        },
        separatorBuilder: (context, index) {
          return Divider(height: 1);
        },
      ),
    );
  }

  Widget item() {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            final detail = _dummyPostDetail();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ChatDetailPage(post: detail, chatRoomId: detail.chatroomId),
              ),
            );
          },
          child: Container(
            height: 80,
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 프로필 + 이름
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    SizedBox.square(
                      dimension: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/p1.jpg'),
                      ),
                    ),
                    Text(
                      '강준석',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 20),

                // 내용
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '삼겹살 먹으러 갈 사람 구함',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        ChatDetailTimeFormat(DateTime.now()),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                // fork 이미지 - 프로필 사진과 같은 크기
                Container(
                  width: 70,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Image.asset('assets/fork.png', fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

PostDetail _dummyPostDetail() {
  return PostDetail(
    postid: 'dummy',
    hostId: 'host',
    hostNickname: '호스트',
    hostProfileImage: '',
    postTitle: '삼겹살 먹으러 갈 사람 구함',
    description: '채팅 탭 더미 데이터',
    restName: '하남돼지 사당점',
    location: Location(lat: 37.5665, lng: 126.9780, address: '서울시'),
    images: const [],
    reservedAt: DateTime.now(),
    chatroomId: 'chat_dummy',
  );
}
