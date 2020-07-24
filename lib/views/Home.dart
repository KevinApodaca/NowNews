import 'package:NowNews/helper/News.dart';
import 'package:NowNews/helper/data.dart';
import 'package:NowNews/models/ArticleModel.dart';
import 'package:NowNews/models/CategoryModel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Now", style: TextStyle(color: Colors.white)),
            Text(
              "News",
              style: TextStyle(color: Colors.lightBlueAccent),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                print("Info clicked");
              },
              icon: const Icon(
                Icons.info_outline,
              ))
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Padding(
              padding: EdgeInsets.only(
                top: 18,
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    /* Showing Categories */
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imgUrl: categories[index].imgUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),
                    /* Showing News Articles */
                    Container(
                      child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imgUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            desc: articles[index].desc,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imgUrl, categoryName;
  CategoryTile({this.imgUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imgUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black54,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imgUrl, title, desc;
  BlogTile({@required this.imgUrl, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[Image.network(imgUrl), Text(title), Text(desc)],
      ),
    );
  }
}
