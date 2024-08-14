import 'package:dartz/dartz.dart';
import 'package:dash/api%20integration/failures.dart';
import '../model/category_model/category_model.dart';
import '../model/skill_model/skill_modal.dart';

abstract class CategoryRepo {
  Future<Either<Failure, CategoryModel>> addCategory(
      Map<String, dynamic> catData);
  Future<Either<Failure, Unit>> deleteCategory(int catId);
  Future<Either<Failure, List<CategoryModel>>> fetchCategories();
  Future<Either<Failure, List<SkillModal>>> fetchSkillsByCategory(int catId);
}
