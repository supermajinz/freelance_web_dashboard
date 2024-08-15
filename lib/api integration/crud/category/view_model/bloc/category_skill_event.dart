part of 'category_skill_bloc.dart';

sealed class CategorySkillEvent extends Equatable {
  const CategorySkillEvent();

  @override
  List<Object> get props => [];
}

final class AddCategoryEvent extends CategorySkillEvent {
  final Map<String, dynamic> categoryData;

  const AddCategoryEvent(this.categoryData);

  @override
  List<Object> get props => [categoryData];
}

final class GetCategoriesEvent extends CategorySkillEvent {}

final class DeleteCategoryEvent extends CategorySkillEvent {
  final int categoryId;

  const DeleteCategoryEvent(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

final class AddSkillEvent extends CategorySkillEvent {
  final Map<String, dynamic> skillData;

  const AddSkillEvent(this.skillData);

  @override
  List<Object> get props => [skillData];
}

final class GetSkillsByCategoryEvent extends CategorySkillEvent {
  final int categoryId;

  const GetSkillsByCategoryEvent(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

final class DeleteSkillEvent extends CategorySkillEvent {
  final int skillId;

  const DeleteSkillEvent(this.skillId);

  @override
  List<Object> get props => [skillId];
}
