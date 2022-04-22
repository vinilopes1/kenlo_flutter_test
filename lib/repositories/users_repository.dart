
import 'package:kenlo_flutter_test/providers/users_provider.dart';

class UsersRepository {

  final UsersProvider api;

  UsersRepository(this.api);

  getUser(id){
    return api.getUser(id);
  }

}