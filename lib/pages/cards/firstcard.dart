
import 'package:flutter/material.dart';
import 'package:petpix/pages/searchlist.dart';



class SearchView extends StatelessWidget {
  SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                filled: true,
                fillColor: Colors.orange.shade200,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                )),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: searchUsers.length,
          itemBuilder: (context, index) {
            var data = searchUsers[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(data['profileImageUrl']),
              ),
              title: Text(data['username']),
              subtitle: Text(data['fullName']),
            );
          }),
    );
  }
}