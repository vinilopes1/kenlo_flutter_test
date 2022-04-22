import 'dart:convert';

import 'package:get/get.dart';
import 'package:kenlo_flutter_test/models/users_model.dart';

const baseUrl = 'https://my-json-server.typicode.com/vinilopes1/fake-api-test/users';

class UsersProvider extends GetConnect {

  Future<User> getUser(int id) async {
    User user = User();
    final response = await get('${baseUrl}/$id', decoder:(body) {
      user = User.fromJson(body);
      return user;
    });

    if(response.hasError){
      throw Exception('Erro ao buscar usuários.');
    }
    return user;
  }

}