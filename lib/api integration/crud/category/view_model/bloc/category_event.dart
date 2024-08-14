part of 'category_bloc.dart';

sealed class CategoryEvent {}

class AddCategory extends CategoryEvent {
  final Map<String, dynamic> catData;

  AddCategory(this.catData);
}

class DeleteCategory extends CategoryEvent {
  final int catId;

  DeleteCategory(this.catId);
}

class FetchCategories extends CategoryEvent {}

class FetchSkillsByCategoryEvent extends CategoryEvent {
  final int categoryId;
  FetchSkillsByCategoryEvent(this.categoryId);
}
