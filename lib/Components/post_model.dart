class Post {
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;
  Post({
    required this.authorName,
    required this.authorImageUrl,
    required this.timeAgo,
    required this.imageUrl,
  });
}

final List<Post> posts = [
  Post(
      authorName: 'Jesse Catman',
      authorImageUrl: "model/assets/jesse.jpg",
      timeAgo: "5 min",
      imageUrl: "model/assets/jesse.jpg"),
  Post(
      authorName: 'Mırmır',
      authorImageUrl: "model/assets/mırmır.jpg",
      timeAgo: "5 min",
      imageUrl: "model/assets/mırmır.jpg"),
  Post(
      authorName: 'Nezaket',
      authorImageUrl: "model/assets/nezaket.jpg",
      timeAgo: "5 min",
      imageUrl: "model/assets/nezaket.jpg"),
  Post(
      authorName: 'Resul',
      authorImageUrl: "model/assets/resul.jpg",
      timeAgo: "5 min",
      imageUrl: "model/assets/resul.jpg"),
];

final List<String> stories = [
  "model/assets/jesse.jpg",
  "model/assets/mırmır.jpg",
  "model/assets/nezaket.jpg",
  "model/assets/resul.jpg",

];
