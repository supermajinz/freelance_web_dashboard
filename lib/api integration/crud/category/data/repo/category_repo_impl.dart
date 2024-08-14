import 'package:dartz/dartz.dart';
import 'package:dash/api%20integration/api_service.dart';
import 'package:dash/api%20integration/crud/category/data/model/category_model/category_model.dart';
import 'package:dash/api%20integration/crud/category/data/model/skill_model/skill_modal.dart';
import 'package:dash/api%20integration/crud/category/data/repo/category_repo.dart';
import 'package:dash/api%20integration/failures.dart';
import 'package:dio/dio.dart';

class CategoryRepoImpl implements CategoryRepo {
  final ApiService apiService;

  CategoryRepoImpl(this.apiService);
  @override
  Future<Either<Failure, CategoryModel>> addCategory(
      Map<String, dynamic> catData) async {
    try {
      final response = await apiService.post('category', catData);
      final project = CategoryModel.fromJson(response);
      return Right(project);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCategory(int catId) async {
    try {
      await apiService.delete('category/$catId');
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategories() async {
    try {
      var data = await apiService.get('category');
      List<CategoryModel> category = [];
      for (var item in data['categories']) {
        category.add(CategoryModel.fromJson(item));
      }
      return right(category);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SkillModal>>> fetchSkillsByCategory(
      int categoryId) async {
    try {
      var data = await apiService.get('skill/$categoryId');
      List<SkillModal> skill = [];
      for (var item in data['skills']['body']) {
        skill.add(SkillModal.fromJson(item));
      }
      return right(skill);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
