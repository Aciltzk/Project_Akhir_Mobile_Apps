import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_akhir/detail.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _posts = [];

  Future _getData() async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=id&apiKey=33be5113d77b4e6788fd641c1cf02ed2');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Berita Hoaks !!",
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
                color: Colors.grey[200],
                height: 100,
                width: 100,
                child: _posts[index]['urlToImage'] != null
                    ? Image.network(
                        _posts[index]['urlToImage'],
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    : Center()),
            title: Text(
              '${_posts[index]['title']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text('${_posts[index]['description']}',
                maxLines: 2, overflow: TextOverflow.ellipsis),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (c) => Detail(
                            url: _posts[index]['url'],
                            title: _posts[index]['title'],
                            content: _posts[index]['content'],
                            publishedAt: _posts[index]['publishAt'],
                            author: _posts[index]['autor'],
                            urlToImage: _posts[index]['urlToImage'],
                          )));
            },
          );
        },
      ),
    );
  }
}
