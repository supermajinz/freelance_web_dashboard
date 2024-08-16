import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/model/category_model/category_model.dart';
import '../../data/model/skill_model/skill_modal.dart';
import '../../data/repo/category_repo.dart';

part 'category_skill_event.dart';
part 'category_skill_state.dart';

class CategorySkillBloc extends Bloc<CategorySkillEvent, CategorySkillState> {
  final CategoryRepo categoryRepo;

  CategorySkillBloc(this.categoryRepo) : super(CategorySkillInitial()) {
    on<AddCategoryEvent>((event, emit) async {
      emit(CategorySkillLoading());
      final failureOrSuccess =
          await categoryRepo.addCategory(event.categoryData);
      failureOrSuccess.fold(
        (failure) => emit(CategorySkillFailure(failure.errMessage)),
        (category) => emit(CategoryAddSuccess(category)),
      );
    });

    on<GetCategoriesEvent>((event, emit) async {
      emit(CategorySkillLoading());
      final results = await categoryRepo.fetchCategories();
      await results.fold(
        (failure) async => emit(CategorySkillFailure(failure.errMessage)),
        (categories) async {
          Map<int, List<SkillModal>> skillsByCategory = {};
          for (var category in categories) {
            final skillsResult =
                await categoryRepo.fetchSkillsByCategory(category.id);
            skillsResult.fold(
              (failure) => emit(CategorySkillFailure(failure.errMessage)),
              (skills) => skillsByCategory[category.id] = skills,
            );
          }
          emit(CategoriesSkillsFetchSuccess(
              categories: categories, skillsByCategory: skillsByCategory));
        },
      );
    });

    on<DeleteCategoryEvent>((event, emit) async {
      emit(CategorySkillLoading());
      final failureOrSuccess =
          await categoryRepo.deleteCategory(event.categoryId);
      failureOrSuccess.fold(
        (failure) => emit(CategorySkillFailure(failure.errMessage)),
        (_) => emit(CategoryDeleteSuccess()),
      );
    });

    on<AddSkillEvent>((event, emit) async {
      emit(CategorySkillLoading());
      final failureOrSuccess = await categoryRepo.addSkill(event.skillData);
      failureOrSuccess.fold(
        (failure) => emit(CategorySkillFailure(failure.errMessage)),
        (skill) => emit(SkillAddSuccess(skill)),
      );
    });

    on<GetSkillsByCategoryEvent>((event, emit) async {
      if (state is CategoriesSkillsFetchSuccess) {
        final currentState = state as CategoriesSkillsFetchSuccess;
        // Emit a loading state for the specific category
        emit(CategorySkillLoadingForCategory(
          currentState.categories,
          currentState.skillsByCategory,
          event.categoryId,
        ));

        final results =
            await categoryRepo.fetchSkillsByCategory(event.categoryId);
        results.fold(
          (failure) => emit(CategorySkillFailure(failure.errMessage)),
          (skills) {
            final updatedSkillsByCategory =
                Map<int, List<SkillModal>>.from(currentState.skillsByCategory)
                  ..[event.categoryId] = skills;

            emit(CategoriesSkillsFetchSuccess(
              categories: currentState.categories,
              skillsByCategory: updatedSkillsByCategory,
            ));
          },
        );
      }
    });
    on<DeleteSkillEvent>((event, emit) async {
      emit(CategorySkillLoading());
      final failureOrSuccess = await categoryRepo.deleteSkill(event.skillId);
      failureOrSuccess.fold(
        (failure) => emit(CategorySkillFailure(failure.errMessage)),
        (_) => emit(SkillDeleteSuccess()),
      );
    });
  }
}
