import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/core/viewmodel/home_view_model.dart';
import 'package:provider_architecture/core/viewstate.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/shared/ui_helpers.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/postlist_item.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        onModelReady: (model) {
          model.getPosts(Provider
              .of<User>(context)
              .id);
        },
        builder: (context, model, child) =>
            Scaffold(
                backgroundColor: backgroundColor,
                body: model.state == ViewState.Idle
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    UIHelper.verticalSpaceLarge(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Welcome ${Provider
                            .of<User>(context)
                            .name}',
                        style: headerStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('Here are all your posts', style: subHeaderStyle),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    Expanded(child: getPostsUi(model.posts, model)),
                  ],
                )
                    : Center(
                  child: CircularProgressIndicator(),
                )));
  }

  Widget getPostsUi(List<Post> posts, HomeViewModel viewModel) =>
      ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) =>
          posts.isNotEmpty
              ? PostListItem(
            post: posts[index],
            onTap: () {
              Navigator.pushNamed(context, 'post', arguments: posts[index]);
            },
          )
              : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Couldnt get your post',
                  style: subHeaderStyle,
                ),
                UIHelper.verticalSpaceMedium(),
                FlatButton(
                  child: Text('Retry'),
                  onPressed: () =>
                      viewModel.getPosts(Provider
                          .of<User>(context)
                          .id),
                )
              ],
            ),
          ));
}
