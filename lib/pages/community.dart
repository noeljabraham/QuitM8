import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  List<String> posts = [];
  TextEditingController _postController = TextEditingController();

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: posts.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _postController,
                    decoration: InputDecoration(
                      hintText: 'Share Your Thoughts',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple), // Set the line color
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple), // Set the line color
                      ),
                    ),
                    cursorColor: Colors.deepPurple[200],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _postThought();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _postThought() {
    String newPost = _postController.text;
    if (newPost.isNotEmpty) {
      setState(() {
        posts.add(newPost);
        _postController.clear();
      });
    }
  }
}
