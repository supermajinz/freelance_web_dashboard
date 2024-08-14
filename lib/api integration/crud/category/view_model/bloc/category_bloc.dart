import 'package:bloc/bloc.dart';
import 'package:dash/api%20integration/crud/category/data/model/skill_model/skill_modal.dart';
import 'package:dash/api%20integration/crud/category/data/repo/category_repo.dart';
import '../../data/model/category_model/category_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo repo;

  CategoryBloc(this.repo) : super(CategoryInitial()) {
    on<AddCategory>(_onAddCategory);
    on<DeleteCategory>(_onDeleteCategory);
    on<FetchCategories>(_fetchCategories);
    on<FetchSkillsByCategoryEvent>(_fetchSkills);
  }

  Future<void> _onAddCategory(
    AddCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final result = await repo.addCategory(event.catData);
    result.fold(
      (failure) => emit(CategoryFailure(failure.errMessage)),
      (cat) {
        emit(CategorySuccess(cat));
      },
    );
  }

  Future<void> _onDeleteCategory(
    DeleteCategory event,
    Emitter<CategoryState> emit,
  ) async {
    final result = await repo.deleteCategory(event.catId);
    result.fold(
      (failure) => emit(CategoryFailure(failure.errMessage)),
      (_) => emit(CategoryDeleteSuccess()),
    );
  }

  Future<void> _fetchCategories(
    FetchCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final results = await repo.fetchCategories();
    await results.fold(
      (failure) async => emit(CategoryFailure(failure.errMessage)),
      (categories) async {
        Map<int, List<SkillModal>> skillsByCategory = {};
        for (var category in categories) {
          final skillsResult = await repo.fetchSkillsByCategory(category.id);
          skillsResult.fold(
            (failure) => emit(CategoryFailure(failure.errMessage)),
            (skills) => skillsByCategory[category.id] = skills,
          );
        }
        emit(GetCategorySuccess(categories, skillsByCategory));
      },
    );
  }

  Future<void> _fetchSkills(
    FetchSkillsByCategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final results = await repo.fetchSkillsByCategory(event.categoryId);
    results.fold(
      (failure) => emit(CategoryFailure(failure.errMessage)),
      (skills) {
        if (state is GetCategorySuccess) {
          final loadedState = state as GetCategorySuccess;
          final updatedSkillsByCategory =
              Map<int, List<SkillModal>>.from(loadedState.skillsByCategory)
                ..[event.categoryId] = skills;

          emit(GetCategorySuccess(
            loadedState.categories,
            updatedSkillsByCategory,
          ));
        }
      },
    );
  }
}
