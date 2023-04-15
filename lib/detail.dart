import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  final url;
  final title;
  final content;
  final publishedAt;
  final author;
  final urlToImage;

  Detail(
      {this.url,
      this.title,
      this.content,
      this.publishedAt,
      this.author,
      this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          urlToImage != null
              ? Image.network(urlToImage)
              : Container(
                  height: 250,
                  color: Colors.grey[200],
                ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$publishedAt',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('$content'),
                Divider(),
                Text('Author : $author'),
                Text('$url'),
                // LaunchButton('$url', () async {
                //   await openUrl('$url');
                // })
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


//blom selesai,, buat klik link ---

// class LaunchButton extends StatelessWidget {
//   final String text;
//   final Function onTapp;

//   LaunchButton(this.text, this.onTapp);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 330,

//       // (Text(text), color: Colors.blue[100], onPressed: onTapp),
//     );
//   }
// }

// Future<void> openUrl(String url,
//     {bool forWebView = false, bool enableJavaScript = false}) async {
//   await launch(url);
// }
