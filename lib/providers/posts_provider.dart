  import 'dart:convert';

  import 'package:get/get.dart';
  import 'package:kenlo_flutter_test/models/posts_model.dart';

  const baseUrl = 'https://my-json-server.typicode.com/vinilopes1/fake-api-test/posts';

  class PostsProvider extends GetConnect {

  // Get request
  Future<List<Post>> getPosts() async {
      List<Post> postsList = <Post>[];
      final response = await get(baseUrl, decoder:(body) {
        postsList = postFromJson(body) as List<Post>;
        return postsList;
      });

      if(response.hasError){
        throw Exception('Erro ao buscar posts.');
      }
      return postsList;
    }
  }