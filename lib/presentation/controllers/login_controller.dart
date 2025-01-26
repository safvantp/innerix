import 'package:ecom/domain/usucases/login_usecase.dart';
import 'package:get/get.dart';
import '../../domain/entities/user_entity.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  var isLoading = false.obs;
  UserEntity? user;

  LoginController(this.loginUseCase);

 Future<void> login(String email, String password) async {
  // isLoading.value = true;
  try {
    user = await loginUseCase.execute(email, password);
    if (user != null) {
      print('User: ${user!.name}');
      Get.offNamed('/bottomnavigation', arguments: user);
    } else {
      throw Exception('Failed to retrieve user data');
    }
  } catch (e) {
    Get.snackbar('Error', e.toString());
    print('Login Error: $e');
  } finally {
    isLoading.value = false;
  }
}

}
