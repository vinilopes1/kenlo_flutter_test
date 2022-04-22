import 'package:get/get.dart';
import 'package:kenlo_flutter_test/models/users_model.dart';
import 'package:kenlo_flutter_test/providers/users_provider.dart';
import 'package:kenlo_flutter_test/repositories/users_repository.dart';

class UsersController extends GetxController {

  final usersRepository = Get.put(UsersRepository(UsersProvider()));
  final user = User().obs;
  RxBool loading = false.obs;

  getUser(id){
    loading(true);
    usersRepository.getUser(id).then((data) {
      user.value = data;
      loading(false);
    }, onError: (e){
      loading(false);
    });
  }
}