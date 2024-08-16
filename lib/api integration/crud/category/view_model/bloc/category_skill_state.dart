part of 'category_skill_bloc.dart';

sealed class CategorySkillState extends Equatable {
  const CategorySkillState();

  @override
  List<Object> get props => [];
}

final class CategorySkillInitial extends CategorySkillState {}

final class CategorySkillLoading extends CategorySkillState {}

final class CategoryAddSuccess extends CategorySkillState {
  final CategoryModel category;

  const CategoryAddSuccess(this.category);

  @override
  List<Object> get props => [category];
}

final class CategoriesSkillsFetchSuccess extends CategorySkillState {
  final List<CategoryModel> categories;
  final Map<int, List<SkillModal>> skillsByCategory;

  const CategoriesSkillsFetchSuccess(
      {required this.categories, required this.skillsByCategory});

  @override
  List<Object> get props => [categories, skillsByCategory];
}

final class CategoryDeleteSuccess extends CategorySkillState {}

final class SkillAddSuccess extends CategorySkillState {
  final SkillModal skill;

  const SkillAddSuccess(this.skill);

  @override
  List<Object> get props => [skill];
}

final class SkillDeleteSuccess extends CategorySkillState {}

final class CategorySkillFailure extends CategorySkillState {
  final String errMessage;

  const CategorySkillFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

final class CategorySkillDeleteFailure extends CategorySkillState {
  final String errMessage;

  const CategorySkillDeleteFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

class CategorySkillLoadingForCategory extends CategorySkillState {
  final List<CategoryModel> categories;
  final Map<int, List<SkillModal>> skillsByCategory;
  final int loadingCategoryId;

  CategorySkillLoadingForCategory(
      this.categories, this.skillsByCategory, this.loadingCategoryId);
}
