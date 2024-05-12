class Comment {
  String authorName;
  String authorImageUrl;
  String text;

  Comment({
    required this.authorName,
    required this.authorImageUrl,
    required this.text,
  });
}

final List<Comment> comments = [
  Comment(
    authorName: 'Pişi',
    authorImageUrl: 'model/assets/user1.jpg',
    text: 'Loving this photo!!',
  ),
  Comment(
    authorName: 'miyavsu',
    authorImageUrl:'model/assets/user2.jpg',
    text: 'One of the best photos of you...',
  ),
  Comment(
    authorName: 'hamsi',
    authorImageUrl: 'model/assets/user3.jpg',
    text: 'Can\'t wait for you to post more!',
  ),
  Comment(
    authorName: 'dursun',
    authorImageUrl: 'model/assets/user4.jpg',
    text: 'Nice job',
  ),
    Comment(
    authorName: 'pıtırcık',
    authorImageUrl: 'model/assets/user4.jpg',
    text: 'Thanks everyone :)',
  ),
];