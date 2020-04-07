import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_architecture/core/model/github_response.dart';

class ApiService {
  static const baseUrl = 'https://api.github.com/';

  var client = new http.Client();

  Future<GithubResponse> fetchGithubRepos(String keyword, String page) async {
    // Get user profile for id
    var response = await client.get('https://api.github.com/search/repositories?q=$keyword&page=1&per_page=$page');
    print('getUserProfile ${response.body}');

    if (response.statusCode == 200) {
      // Convert and return
      return GithubResponse.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
