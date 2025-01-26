import 'package:ecom/data/datasources/remote_catocory.dart';
import 'package:ecom/data/datasources/remote_datasource.dart';
import 'package:ecom/data/i_repositories/category_repository_impl.dart';
import 'package:ecom/data/i_repositories/user_repository_impl.dart';
import 'package:ecom/domain/usucases/get_categories_usecase.dart';
import 'package:ecom/domain/usucases/login_usecase.dart';
import 'package:ecom/presentation/controllers/category_controller.dart';
import 'package:ecom/presentation/controllers/login_controller.dart';
import 'package:ecom/presentation/pages/bottom/naviagation.dart';
import 'package:ecom/presentation/pages/catagory/cataogory.dart';
import 'package:ecom/presentation/pages/home/home.dart';
import 'package:ecom/presentation/pages/login/login1.dart';
import 'package:ecom/presentation/pages/profile/profilescreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  final dio = Dio();
  final remoteDataSource1 = RemoteDatasource(dio);
  final userRepository = UserRepositoryImpl(remoteDataSource1);
  final loginUseCase = LoginUseCase(userRepository);

  final remoteDataSource2 = RemoteDataSource();
  final categoryRepository = CategoryRepositoryImpl(remoteDataSource: remoteDataSource2);
  final getCategoriesUseCase = GetCategoriesUseCase(repository: categoryRepository);

  Get.put(CategoryController(getCategoriesUseCase: getCategoriesUseCase));
  Get.put(LoginController(loginUseCase));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       home: BottomNavigationScreen(),
      getPages: [
        
        GetPage(name: '/login', page: () => loginpage()),
                GetPage(name: '/bottomnavigation', page: () => BottomNavigationScreen()),

        GetPage(name: '/category', page: () => CategoryScreen()),
        GetPage(name: '/profile', page: () => profilescreen()),
      ],
       initialRoute: '/login',
    );
  }
}


