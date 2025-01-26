import 'package:dio/dio.dart';
import 'package:ecom/data/models/user_model.dart';

class RemoteDatasource {
  final Dio dio;

  RemoteDatasource(this.dio);

  Future<UserModel> login(String email, String password) async {
    final String url = 'https://app.ecominnerix.com/api/login';

    try {
      final response = await dio.post(
        url,
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        return UserModel.fromJson(response.data['user']);
      } else {
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } on DioError catch (dioError) {
      print('DioError: ${dioError.response?.data}');
      throw Exception(dioError.response?.data['message'] ?? 'Network error occurred');
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('An unexpected error occurred. Please try again later.');
    }
  }
}
