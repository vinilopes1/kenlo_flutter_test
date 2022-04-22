import 'package:get/get.dart';
import 'package:kenlo_flutter_test/models/posts_model.dart';
import 'package:kenlo_flutter_test/models/users_model.dart';
import 'package:kenlo_flutter_test/providers/posts_provider.dart';
import 'package:kenlo_flutter_test/providers/users_provider.dart';
import 'package:kenlo_flutter_test/repositories/posts_repository.dart';
import 'package:kenlo_flutter_test/repositories/users_repository.dart';

class PostsController extends GetxController {
  final postsRepository = Get.put(PostsRepository(PostsProvider()));
  final usersRepository = Get.put(UsersRepository(UsersProvider()));
  final postsList = <Post>[].obs;
  final user = User().obs;
  RxBool loading = false.obs;


  @override
  void onReady() {
    getPosts();
    super.onReady();
  }

  getPosts() {
    loading(true);
    postsRepository.getPosts().then((List<Post> data) async{
      await getUserForPost(data).then((postsWithUser){
        postsList.value = data;
      });
      loading(false);
    }, onError: (e){
      loading(false);
    });
  }

  Future<List<Post>>getUserForPost(List<Post> posts) async {
    loading(true);
    for (Post post in posts) {
      await usersRepository.getUser(post.id).then((User data) {
        post.user = data.name!;
      }, onError: (e){
        loading(false);
      });
    }
    loading(false);
    return posts;
  }
}