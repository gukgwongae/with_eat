import 'package:flutter/material.dart';
import '../../../add_post_page.dart';
import 'home_list_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<AddDetail> posts = [];

  void _addPost() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPost()),
    );
    if (result != null && result is AddDetail) {
      setState(() {
        posts.insert(0, result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("가치먹자"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostDetail()),
              );
            },
            child: HomeListItem(post: posts[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPost,
        child: const Icon(Icons.add),
      ),
    );
  }
}
