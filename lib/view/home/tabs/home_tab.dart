import 'package:flutter/material.dart';
import 'package:with_eat/core/user_session.dart';
import 'package:with_eat/model/post_detail/post_detail.dart';
import 'package:with_eat/repository/post_detail_repository.dart';
import 'package:with_eat/view/post_detail/post_detail_page.dart';
import '../../../add_post_page.dart';
import 'home_list_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final PostDetailRepository _repository = PostDetailRepository();
  final List<PostDetail> posts = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final fetched = await _repository.fetchAll();
      setState(() {
        posts
          ..clear()
          ..addAll(fetched);
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  PostDetail _fromAddDetail(AddDetail post, String nickname) {
    return PostDetail(
      postid: DateTime.now().millisecondsSinceEpoch.toString(),
      hostId: nickname,
      hostNickname: nickname,
      hostProfileImage:
          'https://cdn.pixabay.com/photo/2020/11/11/03/26/pork-belly-5731404_1280.jpg',
      postTitle: post.title,
      description: post.description,
      restName: post.restName,
      location: Location(
        lat: 37.5665,
        lng: 126.9780,
        address: '서울 서초구 방배천로2길 15 1층',
      ),
      images: post.images,
      reservedAt: post.reservedAt,
      chatroomId: 'chat_${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  Future<void> _addPost() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPost()),
    );
    if (result != null && result is AddDetail) {
      final nickname = await UserSession.getNickname() ?? '익명';
      final newPost = _fromAddDetail(result, nickname);
      setState(() {
        posts.insert(0, newPost);
      });
      try {
        await _repository.create(newPost);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('등록 실패: $e')));
        }
      }
      await _loadPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (_isLoading) {
      body = const Center(child: CircularProgressIndicator());
    } else if (_error != null) {
      body = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('게시글을 불러오지 못했습니다.\n$_error'),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _loadPosts, child: const Text('다시 시도')),
          ],
        ),
      );
    } else if (posts.isEmpty) {
      body = const Center(child: Text('등록된 게시글이 없습니다.'));
    } else {
      body = RefreshIndicator(
        onRefresh: _loadPosts,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return HomeListItem(
              post: post,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PostDetailPage(detail: post),
                  ),
                );
              },
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("가치먹자"),
        automaticallyImplyLeading: false,
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: _addPost,
        child: const Icon(Icons.add),
      ),
    );
  }
}
