import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/viewmodel/base_model.dart';
import 'package:provider_architecture/core/viewstate.dart';

import '../../locator.dart';

class HomeViewModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts = [];

  Future<List<Post>> getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
    return posts;
  }
}
