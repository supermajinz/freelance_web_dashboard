import 'package:dash/api%20integration/crud/category/data/model/category_model/category_model.dart';
import 'package:dash/api%20integration/crud/category/data/model/skill_model/skill_modal.dart';
import 'package:dash/api%20integration/crud/category/view_model/bloc/category_skill_bloc.dart';
import 'package:dash/api%20integration/crud/designation/view_model/bloc/job_titles_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppDataManipulationPage extends StatefulWidget {
  const AppDataManipulationPage({super.key});

  @override
  _AppDataManipulationPageState createState() =>
      _AppDataManipulationPageState();
}

class _AppDataManipulationPageState extends State<AppDataManipulationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  int? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    context.read<JobTitlesBloc>().add(GetjobTitle());
    context.read<CategorySkillBloc>().add(GetCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildJobTitlesSection(),
              const SizedBox(height: 32),
              _buildCategoriesSection(),
              const SizedBox(height: 32),
              _buildSkillsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJobTitlesSection() {
    return BlocConsumer<JobTitlesBloc, JobTitlesState>(
      listener: (context, state) {
        if (state is JobTitlesSuccess) {
          GoRouter.of(context).pushReplacement('/mainScreen', extra: 4);
        }
        if (state is JobTitlesDeleteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "Can't delete this job title, a user could be using it")));
        }
      },
      builder: (context, state) {
        if (state is JobTitlesLoading) {
          return const CircularProgressIndicator();
        } else if (state is GetJobTitlesSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Job Titles',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              // Use GridView.builder for a grid layout
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  childAspectRatio: 3,
                ),
                itemCount: state.jobTitles.length,
                itemBuilder: (context, index) {
                  final jobTitle = state.jobTitles[index];
                  return Card(
                    child: ListTile(
                      title: Text(jobTitle.title ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context
                              .read<JobTitlesBloc>()
                              .add(DeleteJobTitle(jobTitle.id!));
                          GoRouter.of(context)
                              .pushReplacement('/mainScreen', extra: 4);
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _showAddJobTitleDialog(context),
                child: const Text('Add Job Title'),
              ),
            ],
          );
        } else if (state is JobTitlesFailure) {
          return Text('Error: ${state.errMessage}');
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildCategoriesSection() {
    return BlocConsumer<CategorySkillBloc, CategorySkillState>(
      listener: (context, state) {
        if (state is CategoryAddSuccess) {
          GoRouter.of(context).pushReplacement('/mainScreen', extra: 4);
        }
        if (state is CategorySkillDeleteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content:
                  Text("Can't delete this item, a user could be using it")));
        }
      },
      builder: (context, state) {
        if (state is CategorySkillLoading) {
          return const CircularProgressIndicator();
        } else if (state is CategoriesSkillsFetchSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              // Use GridView.builder for a grid layout
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6, // Adjust for desired grid columns
                    childAspectRatio: 3),
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Prevent scrolling
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  return Card(
                    child: ListTile(
                      title: Text(category.name),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context
                              .read<CategorySkillBloc>()
                              .add(DeleteCategoryEvent(category.id));
                          GoRouter.of(context)
                              .pushReplacement('/mainScreen', extra: 4);
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _showAddCategoryDialog(context),
                child: const Text('Add Category'),
              ),
            ],
          );
        } else if (state is CategorySkillFailure) {
          return Text('Error: ${state.errMessage}');
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildSkillsSection() {
    return BlocConsumer<CategorySkillBloc, CategorySkillState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CategorySkillLoading) {
          return const CircularProgressIndicator(color: Colors.red);
        }
        if (state is CategoriesSkillsFetchSuccess ||
            state is CategorySkillLoadingForCategory) {
          List<CategoryModel> categories = [];
          Map<int, List<SkillModal>> skillsByCategory = {};

          if (state is CategoriesSkillsFetchSuccess) {
            categories = state.categories;
            skillsByCategory = state.skillsByCategory;
          } else if (state is CategorySkillLoadingForCategory) {
            categories = state.categories;
            skillsByCategory = state.skillsByCategory;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Skills', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              DropdownButton<int>(
                value: _selectedCategoryId,
                hint: const Text('Select a category'),
                onChanged: (value) {
                  setState(() {
                    _selectedCategoryId = value;
                  });
                  if (value != null) {
                    context
                        .read<CategorySkillBloc>()
                        .add(GetSkillsByCategoryEvent(value));
                  }
                },
                items: categories.map((category) {
                  return DropdownMenuItem<int>(
                    value: category.id,
                    child: Text(category.name),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              if (_selectedCategoryId != null)
                state is CategorySkillLoadingForCategory &&
                        state.loadingCategoryId == _selectedCategoryId
                    ? const CircularProgressIndicator()
                    : _buildSkillsList(
                        skillsByCategory[_selectedCategoryId] ?? []),
              const SizedBox(height: 16),
              if (_selectedCategoryId != null)
                ElevatedButton(
                  onPressed: () => _showAddSkillDialog(context),
                  child: const Text('Add Skill'),
                ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildSkillsList(List<SkillModal> skills) {
    print("skills this is probabaly whats wrong ${skills.toString()}");
    if (skills.isEmpty) {
      return const Text('No skills found for this category.');
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // Prevent scrolling
        itemCount: skills.length,
        itemBuilder: (context, index) {
          final skill = skills[index];
          return ListTile(
            title: Text(skill.name),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context
                    .read<CategorySkillBloc>()
                    .add(DeleteSkillEvent(skill.id));
                GoRouter.of(context).pushReplacement('/mainScreen', extra: 4);
              },
            ),
          );
        },
      );
    }
  }

  void _showAddJobTitleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Job Title'),
        content: Form(
          key: _formKey,
          child: TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Job Title'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a job title';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context
                    .read<JobTitlesBloc>()
                    .add(AddjobTitle({'title': _nameController.text}));
                Navigator.pop(context);
                _nameController.clear();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showAddCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Category'),
        content: Form(
          key: _formKey,
          child: TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Category Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a category name';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Provide a placeholder photo path for now
                context.read<CategorySkillBloc>().add(AddCategoryEvent({
                      'name': _nameController.text,
                      'photoPath': 'placeholder.jpg' // Placeholder
                    }));
                Navigator.pop(context);
                _nameController.clear();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showAddSkillDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Skill'),
        content: Form(
          key: _formKey,
          child: TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Skill Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a skill name';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<CategorySkillBloc>().add(AddSkillEvent({
                      'name': _nameController.text,
                      'categoryId': _selectedCategoryId,
                    }));
                GoRouter.of(context).pushReplacement('/mainScreen', extra: 4);
                _nameController.clear();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
