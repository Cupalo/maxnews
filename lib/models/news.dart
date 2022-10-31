class News {
  News({
    this.status,
    this.totalResults,
    this.articles,
  });

  final String? status;
  final int? totalResults;
  final List<Articles>? articles;

  factory News.fromJson(Map<String, dynamic> json) => News(
        status: json['status'],
        totalResults: json['totalResults'],
        articles: json["articles"] == null
            ? null
            : List<Articles>.from(
                json["articles"].map((x) => Articles.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null
            ? null
            : List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class Articles {
  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  final Source? source;
  final String? title;
  final String? author;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        source: Source.fromJson(json["source"]),
        title: json["title"],
        author: json["author"],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: DateTime.tryParse(json['publishedAt'] ?? '0'),
        content: json['content'],
      );

  Map<String, dynamic> toJson() => {
        "source": source,
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt,
        'content': content,
      };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        'name': name,
      };
}
