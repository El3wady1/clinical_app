import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/home/repo/getnewsrepo.dart';
import 'package:appnote/feature/home/services/luanchurlnews.dart';
import 'package:flutter/material.dart';

class NewsHealth extends StatelessWidget {
  @override
  bool lang  ;

  NewsHealth({required this.lang});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,


        backgroundColor: Colors.pink.shade700,
        centerTitle: true,
        title: Text(
          "اخباراليوم الطبيه",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: GethealthNews(isArabic: lang),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: snapshot.data![index]["urlToImage"] == null
                      ? Image.asset("assets/images/news.png")
                      : Image.network("${snapshot.data![index]["urlToImage"]}"),
                  title: Text(snapshot.data![index]['title'] ?? ''),
                  trailing: Text(snapshot.data![index]['publishedAt'] ?? ''),
                  subtitle: Text(snapshot.data![index]['description'] ?? ''),
                  onTap: () async{
                  await  UlaunchURL(snapshot.data![index]['url']);
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(),
            );
          }
        },
      ),
    );
  }
}
