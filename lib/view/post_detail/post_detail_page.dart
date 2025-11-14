import 'package:flutter/material.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_app_bar.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_botto_bar.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_image.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_info.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_map.dart';
import 'package:with_eat/view/post_detail/widgets/post_detail_user_information.dart';
import '../../model/post_detail/post_detail.dart';

class PostDetailPage extends StatelessWidget {
  final PostDetail detail;

  const PostDetailPage({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
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
            ImageSection(images: detail.images),
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
        onChat: () {
        },
        onFavorite: () {
        },
      ),
    );
  }

}
