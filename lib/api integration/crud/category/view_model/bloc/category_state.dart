part of 'category_bloc.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class GetCategorySuccess extends CategoryState {
  final List<CategoryModel> categories;
  final Map<int, List<SkillModal>> skillsByCategory;

  GetCategorySuccess(this.categories, this.skillsByCategory);
}

final class CategoryDeleteSuccess extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final CategoryModel category;

  CategorySuccess(this.category);
}

final class CategoryFailure extends CategoryState {
  final String errMessage;

  CategoryFailure(this.errMessage);
}
