import 'package:dash/api%20integration/dependency_injection.dart';
import 'package:dash/api%20integration/project/project_model/project_model.dart';
import 'package:dash/api%20integration/project/view_model/bloc/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectBloc(DependencyInjection.provideProjectRepo())
        ..add(const SearchProjectsEvent(filters: {'sort': 'createDate:desc'})),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              GoRouter.of(context).pushReplacement('/mainScreen', extra: 3),
          child: const Icon(Icons.refresh),
        ),
        body: BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            if (state is ProjectLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SearchSuccess) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount =
                      _calculateCrossAxisCount(constraints.maxWidth);
                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: _calculateChildAspectRatio(
                          constraints.maxWidth, crossAxisCount),
                    ),
                    padding: const EdgeInsets.all(16),
                    itemCount: state.projects.length,
                    itemBuilder: (context, index) {
                      final project = state.projects[index];
                      return ProjectCard(project: project);
                    },
                  );
                },
              );
            } else if (state is ProjectFailure) {
              return Center(child: Text('Error: ${state.errMessage}'));
            }
            return const Center(child: Text('No projects found'));
          },
        ),
      ),
    );
  }

  int _calculateCrossAxisCount(double width) {
    if (width > 1200) return 4;
    if (width > 900) return 3;
    if (width > 600) return 2;
    return 1;
  }

  double _calculateChildAspectRatio(double width, int crossAxisCount) {
    double cardWidth =
        (width - (32 + (crossAxisCount - 1) * 20)) / crossAxisCount;
    return cardWidth / (cardWidth * 1.5);
  }
}

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.project.name,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildStatusChip(widget.project.status),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Created: ${DateFormat('MMM d, yyyy').format(widget.project.createDate ?? DateTime.now())}',
                style: TextStyle(
                    color: Theme.of(context).textTheme.labelSmall!.color),
              ),
              if (_isExpanded) ...[
                const SizedBox(height: 16),
                _buildInfoRow(context, Icons.description, 'Description',
                    widget.project.description),
                _buildInfoRow(context, Icons.attach_money, 'Budget',
                    'SYP${widget.project.minBudget} - SYP${widget.project.maxBudget}'),
                _buildInfoRow(context, Icons.schedule, 'Duration',
                    '${widget.project.expectedDuration} days'),
                _buildInfoRow(context, Icons.local_offer, 'Offer Count',
                    widget.project.offerCount.toString()),
                _buildInfoRow(context, Icons.category, 'Category',
                    widget.project.projectCategory?.name ?? 'N/A'),
                _buildInfoRow(context, Icons.build, 'Skills',
                    widget.project.projectSkill.map((s) => s.name).join(', ')),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => _confirmDelete(context),
                  icon: const Icon(Icons.delete_forever),
                  label: const Text('Delete Project'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
      BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.secondary, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '$label: $value',
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color chipColor;
    switch (status.toLowerCase()) {
      case 'open':
        chipColor = Colors.green;
        break;
      case 'inprogress':
        chipColor = Colors.blue;
        break;
      case 'submitted':
        chipColor = Colors.orange;
        break;
      case 'completed':
        chipColor = Colors.purple;
        break;
      default:
        chipColor = Colors.grey;
    }

    return Chip(
      label: Text(
        status.toUpperCase(),
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
      backgroundColor: chipColor,
      padding: const EdgeInsets.all(4),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocListener<ProjectBloc, ProjectState>(
          listener: (context, state) {
            if (state is ProjectDeleteFailure) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      "Can't delete this project, it might be in use by a user.")));
            }
          },
          child: AlertDialog(
            title: const Text('Confirm Delete'),
            content: Text(
                'Are you sure you want to delete the project "${widget.project.name}"?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('Delete'),
                onPressed: () {
                  context
                      .read<ProjectBloc>()
                      .add(DeleteProject(widget.project.id));

                  GoRouter.of(context).pushReplacement('/mainScreen', extra: 3);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
