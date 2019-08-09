// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

class NewsModel {
  String status;
  Feed feed;
  List<NewsModelItem> items;

  NewsModel({
    this.status,
    this.feed,
    this.items,
  });

  factory NewsModel.fromMap(Map<String, dynamic> json) => new NewsModel(
        status: json["status"],
        feed: Feed.fromMap(json["feed"]),
        items: new List<NewsModelItem>.from(json["items"].map((x) => NewsModelItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "feed": feed.toMap(),
        "items": new List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class Feed {
  String url;
  String title;
  String link;
  String author;
  String description;
  String image;

  Feed({
    this.url,
    this.title,
    this.link,
    this.author,
    this.description,
    this.image,
  });

  factory Feed.fromMap(Map<String, dynamic> json) => new Feed(
        url: json["url"],
        title: json["title"],
        link: json["link"],
        author: json["author"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "title": title,
        "link": link,
        "author": author,
        "description": description,
        "image": image,
      };
}

class NewsModelItem {
  String title;
  DateTime pubDate;
  String link;
  String guid;
  String author;
  String description;
  String content;
  List<String> categories;

  @override
  String toString() {
    return 'NewsItem {title: $title, pubDate: $pubDate, link: $link, guid: $guid, author: $author, description: $description, content: $content, categories: $categories}';
  }

 
  NewsModelItem({
    this.title,
    this.pubDate,
    this.link,
    this.guid,
    this.author,
    this.description,
    this.content,
    this.categories,
  });

  factory NewsModelItem.fromMap(Map<String, dynamic> json) => new NewsModelItem(
        title: json["title"],
        pubDate: DateTime.parse(json["pubDate"]),
        link: json["link"],
        guid: json["guid"],
        author: json["author"],
        description: json["description"],
        content: json["content"],
        categories: new List<String>.from(json["categories"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "pubDate": pubDate.toIso8601String(),
        "link": link,
        "guid": guid,
        "author": author,
        "description": description,
        "content": content,
        "categories": new List<dynamic>.from(categories.map((x) => x)),
      };
}
