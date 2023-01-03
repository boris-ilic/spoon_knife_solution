import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoon_knife_solution/bloc/main_bloc.dart';
import 'package:spoon_knife_solution/routes/router.dart';
import 'package:spoon_knife_solution/widgets/gql_issue_card.dart';

class MainRoute extends StatelessWidget implements AutoRouteWrapper {
  static const String name = 'MainRoute';

  const MainRoute({super.key});

  @override
  Widget wrappedRoute(context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: this, // this as the child Important!
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<MainBloc>(context)..add(InitialLoadingEvent()),
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
          if (state is LoadedGraphqlDataState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.black87,
              content: Text("Data successfully reached!"),
            ));
          }
        },
        builder: (context, state) {
          if (state is LoadedGraphqlDataState) {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.gqlRepository!.name ?? ''),
              ),
              body: RefreshIndicator(
                onRefresh: () async {
                  context.read<MainBloc>().add(InitialLoadingEvent());
                },
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Text(
                        state.gqlRepository!.description ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    ListView.builder(
                      controller: ScrollController(),
                      shrinkWrap: true,
                      itemCount: state.gqlRepository!.issues!.issuesEdges!.length,
                      itemBuilder: (context, index) {
                        return GqlIssueCard(
                          repository: state.gqlRepository!,
                          index: index,
                          onPress: () {
                            context.router.push(
                              DetailedPage(
                                repository: state.gqlRepository!,
                                index: index,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else if (state is LoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return const Center(
            child: Text("Something went wrong"),
          );
        },
      ),
    );
  }
}
