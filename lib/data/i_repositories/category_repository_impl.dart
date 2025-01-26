import 'package:ecom/data/datasources/remote_catocory.dart';
import 'package:ecom/domain/entities/category_entity.dart';
import 'package:ecom/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final RemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final categories = await remoteDataSource.fetchCategories();

    return categories
        .map((category) => CategoryEntity(
              categoryId: category.categoryId,  
              categoryName: category.categoryName,
              categoryImage: category.categoryImage,
            ))
        .toList();
  }
}
