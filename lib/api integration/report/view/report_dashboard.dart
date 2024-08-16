import 'package:dash/api%20integration/dependency_injection.dart';
import 'package:dash/api%20integration/report/data/model/report_model/report/report.dart';
import 'package:dash/api%20integration/report/view_model/bloc/report_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReportDashboardPage extends StatelessWidget {
  const ReportDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportBloc(DependencyInjection.provideReportRepo())
        ..add(GetReports()),
      child: Scaffold(
        body: BlocConsumer<ReportBloc, ReportState>(
          listener: (context, state) {
            if (state is ReportDeleteFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errMessage)));
            }
            if (state is ReportDelete) {
              GoRouter.of(context).pushReplacement('/mainScreen', extra: 2);
            }
          },
          builder: (context, state) {
            if (state is ReportLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetReportSuccess) {
              return ReportList(reports: state.reports);
            } else if (state is ReportFailure) {
              return Center(child: Text('Error: ${state.errMessage}'));
            }
            return const Center(child: Text('No reports available'));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              GoRouter.of(context).pushReplacement('/mainScreen', extra: 2),
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}

class ReportList extends StatelessWidget {
  final List<Report> reports;

  const ReportList({Key? key, required this.reports}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reports.length,
      itemBuilder: (context, index) {
        return ReportCard(report: reports[index]);
      },
    );
  }
}

class ReportCard extends StatelessWidget {
  final Report report;

  const ReportCard({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isAppReport = report.recipient == null;
    final Color cardColor = isAppReport
        ? Theme.of(context).colorScheme.primaryContainer
        : Theme.of(context).colorScheme.secondary;

    return Card(
      margin: const EdgeInsets.all(8.0),
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isAppReport ? 'App Report' : 'User Report',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('ID: ${report.id}'),
              ],
            ),
            const SizedBox(height: 8),
            Text(report.message ?? 'No message'),
            const SizedBox(height: 8),
            Text('Sender ID: ${report.sender?.id}'),
            Text(
                'Sender Name: ${report.sender?.firstname} ${report.sender?.lastname}'),
            Text('Sender Email: ${report.sender?.email}'),
            Text('Sender Phone: ${report.sender?.phone}'),
            if (!isAppReport) Text('Recipient ID: ${report.recipient}'),
            const SizedBox(height: 8),
            BlocListener<ReportBloc, ReportState>(
              listener: (context, state) {
                if (state is ReportDeleteFailure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.errMessage)));
                }
                if (state is ReportDelete) {
                  GoRouter.of(context).pushReplacement('/mainScreen', extra: 2);
                }
              },
              child: ElevatedButton(
                onPressed: () {
                  context.read<ReportBloc>().add(DeleteReport(report.id!));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('Delete Report'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
