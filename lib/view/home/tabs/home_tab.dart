import 'package:flutter/material.dart';
import 'package:with_eat/core/user_session.dart';
import 'package:with_eat/model/post_detail/post_detail.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as geo;
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
  Future<String> _getCurrentAddress() async {
    try {
      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final placemarks = await geo.placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        // 예시: 서울특별시 중구
        return '${place.administrativeArea ?? ''} ${place.locality ?? ''}'.trim();
      }
      return '주소 정보 없음';
    } catch (e) {
      return '위치 정보 없음';
    }
  }

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
    final lat = post.latitude ?? 37.5665;
    final lng = post.longitude ?? 126.9780;
    final address = post.address ?? '위치 정보가 제공되지 않았습니다';
    return PostDetail(
      postid: DateTime.now().millisecondsSinceEpoch.toString(),
      hostId: nickname,
      hostNickname: nickname,
      hostProfileImage: 'assets/person.png',
      postTitle: post.title,
      description: post.description,
      restName: post.restName,
      location: Location(lat: lat, lng: lng, address: address), // uses your model's Location
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

  Future<void> _confirmDelete(PostDetail post) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('게시글 삭제'),
            content: const Text('해당 게시글을 삭제하시겠습니까?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('취소'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('삭제'),
              ),
            ],
          ),
        ) ??
        false;
    if (!confirmed) return;

    setState(() {
      posts.removeWhere((element) => element.postid == post.postid);
    });
    try {
      await _repository.delete(post);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('게시글이 삭제되었습니다.')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('삭제 실패: $e')));
        await _loadPosts();
      }
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
              onLongPress: () => _confirmDelete(post),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("가치먹쟈"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          FutureBuilder<String>(
            future: _getCurrentAddress(),
            builder: (context, snapshot) {
              final location = snapshot.data ?? '...';
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, size: 20, color: Colors.red),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Expanded(child: body),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPost,
        backgroundColor: Colors.red,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
