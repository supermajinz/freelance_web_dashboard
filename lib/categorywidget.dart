import 'package:dash/api%20integration/crud/category/data/model/category_model/category_model.dart';
import 'package:dash/api%20integration/crud/category/view_model/bloc/category_skill_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategorySkillBloc, CategorySkillState>(
      builder: (context, state) {
        if (state is CategoriesSkillsFetchSuccess) {
          return SizedBox(
            height:300,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 1,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  print('zzzzzzzzzz ${category.name}${category}}');
                  return InkWell(
                    onTap: () {
                      context
                          .read<CategorySkillBloc>()
                          .categoryRepo
                          .fetchSkillsByCategory(category.id);
                      GoRouter.of(context).push("/skills", extra: category.id);
                    },
                    child: CustomCartegoryCard(cat: state.categories[index]));
              },
            ),
          );
        } else if (state is CategorySkillFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class CustomCartegoryCard extends StatelessWidget {
  const CustomCartegoryCard({super.key, required this.cat});
  final CategoryModel cat;

  @override
  Widget build(BuildContext context) {
    print('cat: ${cat.toString()}');
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius:
                BorderRadius.all(Radius.circular(10)),
          ),
          // child: Image.asset("assets/images/ux.png",
          //     height: SizeConfig.defaultSize! * 6,
          //     width: SizeConfig.defaultSize! * 6,
          //     fit: BoxFit.fill),
        ),
        
        SizedBox(
          width: 120,
          child: Text(
            cat.name,
            textAlign: TextAlign.center,
            maxLines: 3,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
