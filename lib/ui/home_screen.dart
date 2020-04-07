import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/locator.dart';
import 'package:provider_architecture/core/model/items.dart';
import 'package:provider_architecture/core/view_state.dart';
import 'package:provider_architecture/core/viewmodel/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      builder: (context) => locator<HomeViewModel>(),
      child: Consumer<HomeViewModel>(builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Flutter Repos'),
          ),
          body: model.state == ViewState.Idle
              ? _buildRepoList(model.items)
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      }),
    );
  }

  Widget _buildRepoList(List<Items> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, int index) {
        final item = items[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(item.owner.avatarUrl.isNotEmpty
                ? item.owner.avatarUrl
                : "https://www.codemate.com/wp-content/uploads/2016/02/flutter-logo-round.png"),
          ),
          title: Text(item.name),
          subtitle: Text(item.fullName),
        );
      },
    );
  }
}
