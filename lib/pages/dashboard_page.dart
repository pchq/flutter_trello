import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layer_domain/layer_domain.dart';
import 'package:module_models/module_models.dart';
import '/theme.dart';
import '/widgets/loading.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardCubit dashboardCubit = context.read<DashboardCubit>();
    dashboardCubit.loadAll();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ThemeConstants.primaryColor,
                shape: const CircleBorder(),
              ),
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                context.read<AuthCubit>().logout();
                Navigator.of(context).pushReplacementNamed('/auth');
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'On hold'),
              Tab(text: 'In progress'),
              Tab(text: 'Needs review'),
              Tab(text: 'Approved'),
            ],
          ),
        ),
        body: BlocConsumer<DashboardCubit, DashboardState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is DashboardLoading) {
              return const Loading();
            } else if (state is DashboardError) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is DashboardLoaded) {
              return _buildTabs(state.cards);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildTabs(List<BoardCard> cards) {
    List<BoardCard> hold = [];
    List<BoardCard> progress = [];
    List<BoardCard> review = [];
    List<BoardCard> approved = [];

    for (var element in cards) {
      switch (element.row) {
        case BoardList.hold:
          hold.add(element);
          break;
        case BoardList.progress:
          progress.add(element);
          break;
        case BoardList.review:
          review.add(element);
          break;
        case BoardList.approved:
          approved.add(element);
          break;
      }
    }

    Widget listView(List<BoardCard> tabcards) => ListView.builder(
          key: PageStorageKey(UniqueKey()),
          itemCount: tabcards.length,
          itemBuilder: (context, index) {
            BoardCard card = tabcards[index];
            return Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        'ID: ${card.id}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Text(
                      card.text,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          },
        );

    return TabBarView(
      children: [
        listView(hold),
        listView(progress),
        listView(review),
        listView(approved),
      ],
    );
  }
}
