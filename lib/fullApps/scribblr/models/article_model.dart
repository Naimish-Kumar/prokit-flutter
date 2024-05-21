import '../utils/constant.dart';
import '../utils/images.dart';
import 'comments_model.dart';

class ArticleResponse {
  final String title;

  final String? listType;

  final List<ArticleModel>? articleList;

  ArticleResponse({
    this.title = '',
    this.listType,
    this.articleList,
  });
}

List<ArticleResponse> getArticleResponse() {
  List<ArticleResponse> articleList = [];
  articleList.add(
    ArticleResponse(title: 'Recent Articles', articleList: getArticleModelList(), listType: recent_article),
  );
  articleList.add(
    ArticleResponse(title: 'Your Articles', articleList: getYourArticleModelList(), listType: your_article),
  );
  articleList.add(
    ArticleResponse(title: 'On Your Bookmark', articleList: getArticleModelList(), listType: bookmark_article),
  );
  return articleList;
}

//Your Articles List
List<ArticleModel> getYourArticleModelList() {
  List<ArticleModel> articleList = [];
  articleList.add(ArticleModel(
      imageAsset: ArticleImage.authEmma,
      title: ArticleTitle.authEmma,
      authorImage: AuthorImage.authEmma,
      authorName: AuthorName.authEmma,
      category: ArticleCategory.authEmma,
      articleContent: ArticleContent.articleContent1,
      commentList: getCommentModelList(),
      authorUserName: '@${AuthorName.authEmma}',
      time: '1 days Ago'));
  articleList.add(ArticleModel(
      imageAsset: ArticleImage.authGeorge,
      title: ArticleTitle.authGeorge,
      authorImage: AuthorImage.authGeorge,
      authorName: AuthorName.authGeorge,
      category: ArticleCategory.authGeorge,
      articleContent: ArticleContent.articleContent2,
      commentList: getCommentModelList(),
      authorUserName: '@${AuthorName.authGeorge}',
      time: '1 days Ago'));
  articleList.add(ArticleModel(
      imageAsset: ArticleImage.authChristina,
      title: ArticleTitle.authChristina,
      authorImage: AuthorImage.authChristina,
      authorName: AuthorName.authChristina,
      category: ArticleCategory.authChristina,
      articleContent: ArticleContent.articleContent3,
      commentList: getCommentModelList(),
      authorUserName: '@${AuthorName.authChristina}',
      time: '1 days Ago'));

  return articleList;
}

//Recent Articles List

List<ArticleModel> getArticleModelList() {
  List<ArticleModel> articleList = [];
  articleList.add(ArticleModel(
      imageAsset: ArticleImage.authEliza,
      title: ArticleTitle.authEliza,
      authorImage: AuthorImage.authEliza,
      authorName: AuthorName.authEliza,
      category: ArticleCategory.authEliza,
      articleContent: ArticleContent.articleContent2,
      commentList: getCommentModelList(),
      authorUserName: '@${AuthorName.authEliza}',
      time: '3 days Ago'));
  articleList.add(ArticleModel(
      imageAsset: ArticleImage.authChris,
      title: ArticleTitle.authChris,
      authorImage: AuthorImage.authChris,
      authorName: AuthorName.authChris,
      category: ArticleCategory.authChris,
      articleContent: ArticleContent.articleContent1,
      commentList: getCommentModelList(),
      authorUserName: '@${AuthorName.authChris}',
      time: '2 days Ago'));
  articleList.add(ArticleModel(
      imageAsset: ArticleImage.authStark,
      title: ArticleTitle.authStark,
      authorImage: AuthorImage.authStark,
      authorName: AuthorName.authStark,
      category: AuthorName.authStark,
      commentList: getCommentModelList(),
      articleContent: ArticleContent.articleContent3,
      authorUserName: '@${AuthorName.authStark}',
      time: '5 days Ago'));
  articleList.add(ArticleModel(
      imageAsset: ArticleImage.authElina,
      title: ArticleTitle.authElina,
      commentList: getCommentModelList(),
      authorImage: AuthorImage.authElina,
      authorName: AuthorName.authElina,
      category: ArticleCategory.authElina,
      articleContent: ArticleContent.articleContent4,
      authorUserName: '@${AuthorName.authElina}',
      time: '1 Week Ago'));
  articleList.add(ArticleModel(
      imageAsset: ArticleImage.authNolan,
      title: ArticleTitle.authNolan,
      commentList: getCommentModelList(),
      authorImage: AuthorImage.authNolan,
      authorName: AuthorName.authNolan,
      category: ArticleCategory.authNolan,
      articleContent: ArticleContent.articleContent5,
      authorUserName: '@${AuthorName.authNolan}',
      time: '2 week Ago'));

  return articleList;
}

List<ArticleResponse> getDiscoverResponse() {
  List<ArticleResponse> articleList = [];
  articleList.add(
    ArticleResponse(
      title: 'Most Popular',
      listType: most_popular,
      articleList: getArticleModelList(),
    ),
  );
  articleList.add(
    ArticleResponse(
      title: 'Explore by Topics',
      listType: explore_by_topics,
      articleList: getExploreByTopic(),
    ),
  );
  articleList.add(
    ArticleResponse(
      title: 'Top Writers',
      listType: top_writers,
      articleList: getWriterList(),
    ),
  );
  articleList.add(
    ArticleResponse(
      title: 'Our Recommendations',
      listType: recommendation,
      articleList: getArticleModelList(),
    ),
  );
  articleList.add(
    ArticleResponse(
      title: 'New Articles',
      listType: new_article,
      articleList: getnewarticleModel(),
    ),
  );

  return articleList;
}

//Explore Topic List
List<ArticleModel> getExploreByTopic() {
  List<ArticleModel> discoverList = [];
  discoverList.add(
    ArticleModel(imageAsset: TopicImage.travel, title: 'Travel', subtitle: '220'),
  );
  discoverList.add(
    ArticleModel(imageAsset: TopicImage.productivity, title: 'Productivity', subtitle: '220'),
  );
  discoverList.add(
    ArticleModel(imageAsset: TopicImage.nature, title: 'Nature', subtitle: '220'),
  );
  discoverList.add(
    ArticleModel(imageAsset: TopicImage.sports, title: 'Sports', subtitle: '220'),
  );
  discoverList.add(
    ArticleModel(imageAsset: TopicImage.education, title: 'Education', subtitle: '220'),
  );
  discoverList.add(
    ArticleModel(imageAsset: TopicImage.music, title: 'Music', subtitle: '220'),
  );
  discoverList.add(
    ArticleModel(imageAsset: TopicImage.business, title: 'Business', subtitle: '220'),
  );
  return discoverList;
}

//Writers List
List<ArticleModel> getWriterList() {
  List<ArticleModel> writerList = [];
  writerList.add(
    ArticleModel(authorImage: AuthorImage.authElina, authorName: AuthorName.authElina),
  );
  writerList.add(
    ArticleModel(authorImage: AuthorImage.authChris, authorName: AuthorName.authChris),
  );
  writerList.add(
    ArticleModel(authorImage: AuthorImage.authNolan, authorName: AuthorName.authNolan),
  );
  writerList.add(
    ArticleModel(authorImage: AuthorImage.authChristina, authorName: AuthorName.authChristina),
  );
  writerList.add(
    ArticleModel(authorImage: AuthorImage.authStuart, authorName: AuthorName.authStuart),
  );

  return writerList;
}

List<ArticleModel> getnewarticleModel() {
  List<ArticleModel> newarticleList = [];
  newarticleList.add(ArticleModel(
      commentList: getCommentModelList(),
      articleContent: ArticleContent.articleContent2,
      imageAsset: ArticleImage.authGeorge,
      title: ArticleTitle.authGeorge,
      authorImage: AuthorImage.authGeorge,
      authorName: AuthorName.authGeorge,
      category: AuthorName.authGeorge,
      time: 'Today'));
  newarticleList.add(ArticleModel(
      commentList: getCommentModelList(),
      articleContent: ArticleContent.articleContent5,
      imageAsset: ArticleImage.authMiller,
      title: ArticleTitle.authMiller,
      authorImage: AuthorImage.authMiller,
      authorName: AuthorName.authMiller,
      category: ArticleCategory.authMiller,
      time: 'Yesterday'));
  newarticleList.add(ArticleModel(
      commentList: getCommentModelList(),
      articleContent: ArticleContent.articleContent4,
      imageAsset: ArticleImage.authChristina,
      title: ArticleTitle.authChristina,
      authorImage: AuthorImage.authChristina,
      authorName: AuthorName.authChristina,
      category: ArticleCategory.authChristina,
      time: 'Yesterday'));

  return newarticleList;
}

class ArticleModel {
  final String? imageAsset;
  final String? title;
  final String? time;
  bool? isFollow;

  String? authorImage;
  String? authorUserName;
  String? authorName;
  String? subtitle;
  String? category;
  String? articleContent;
  List<CommentModel>? commentList;

  ArticleModel({
    this.authorUserName,
    this.imageAsset,
    this.title,
    this.time,
    this.authorName,
    this.authorImage,
    this.subtitle,
    this.category,
    this.articleContent,
    this.commentList,
    this.isFollow = false,
  });
}
