import 'package:flutter/material.dart';
import 'package:petpix/Components/post_model.dart';
import 'package:petpix/pages/view_post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> _likes = List.filled(posts.length, 0);
  List<bool> _liked = List.filled(posts.length, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: SizedBox(
          width: 105,
          height: 28,
          child: Image.asset('model/assets/petpix.png'),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings), // Ayarlar butonu
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
            color: Colors.black,
          ),
        ],
        backgroundColor: const Color(0xffFAFAFA),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildPost(context, index);
        },
      ),
    );
  }

  Widget _buildPost(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ViewPostScreen(
                post: posts[index],
              ),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 560.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image(
                        height: 50.0,
                        width: 50.0,
                        image: AssetImage(posts[index].authorImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  posts[index].authorName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(posts[index].timeAgo),
                trailing: IconButton(
                  icon: const Icon(Icons.more_horiz),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
              InkWell(
                onDoubleTap: () => print('Like post'),
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 400.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 5),
                        blurRadius: 8.0,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(posts[index].imageUrl),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.comment),
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _liked[index] = !_liked[index];
                        if (_liked[index]) {
                          _likes[index]++;
                        } else {
                          _likes[index]--;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: _liked[index] ? Colors.red : Colors.black,
                    ),
                  ),
                  Text(
                    '${_likes[index]}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
