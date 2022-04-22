
import 'package:kenlo_flutter_test/providers/posts_provider.dart';

class PostsRepository {

  final PostsProvider api;

  PostsRepository(this.api);

  getPosts(){
    return api.getPosts();
  }

}