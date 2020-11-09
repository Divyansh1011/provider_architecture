import 'package:provider_architecture/core/enums/viewState.dart';
import 'package:provider_architecture/core/models/comment.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comment;

  Future getComments(int userId) async {
    setState(viewState.Busy);
    comment = await _api.getCommentsForPost(userId);
    setState(viewState.Idle);
  }
}
