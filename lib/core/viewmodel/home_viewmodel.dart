import 'package:flutter/cupertino.dart';
import 'package:provider_architecture/core/model/items.dart';
import 'package:provider_architecture/core/services/api.dart';

import '../locator.dart';
import '../view_state.dart';

class HomeViewModel with ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  HomeViewModel() {
    getGithubRepos("flutter", "40");
  }

  ApiService _api = locator<ApiService>();

  List<Items> items = [];

  Future getGithubRepos(String keyWord, String pageNumber) async {
    if (keyWord.isEmpty) {
      setState(ViewState.Idle);
      return null;
    }
    setState(ViewState.Busy);
    final response = await _api.fetchGithubRepos(keyWord, pageNumber);
    items = response.items;
    print(items);
    setState(ViewState.Idle);
  }
}
