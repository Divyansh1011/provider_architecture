import 'package:provider_architecture/core/services/postservices.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class LikeButtonModel extends BaseModel {
  PostServices _postServices = locator<PostServices>();

  int postLikes(int postId) {
    return _postServices.posts.firstWhere((post) => post.id == postId).likes;
  }

  void postlikesIncrease(int postId) {
    _postServices.increaseLikes(postId);
    notifyListeners();
  }
}
