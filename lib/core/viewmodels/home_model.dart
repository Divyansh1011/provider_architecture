import 'package:provider_architecture/core/enums/viewState.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/services/postservices.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class HomeModel extends BaseModel {
  final PostServices _postsService =
      locator<PostServices>(); //injecting the api from the locator

  //SHow the posts on the screen use the list view

  List<Post> get posts => _postsService.posts;

  Future getPosts(int userId) async {
    setState(viewState.Busy); //Setting the state to busy
    await _postsService.getPostsForUser(
        userId); //Getting all the post of the from the api method
    //the work is done, setting the state back to idle

    setState(viewState.Idle);
  }
}
//Home Model is complete Registering to the locator for the injection
