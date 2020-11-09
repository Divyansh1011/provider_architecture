import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/locator.dart';

class PostServices {
  Api _api = locator<Api>();

  List<Post> _posts;
  List<Post> get posts => _posts;

  Future getPostsForUser(int userId) async {
    _posts = await _api.getPostsForUser(userId);
  }

  void increaseLikes(int postId) 
  {
    _posts.firstWhere((post) => post.id == postId).likes++;
  }


}
