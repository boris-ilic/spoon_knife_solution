part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
  
  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class LoadingState extends MainState {}

class LoadedGraphqlDataState extends MainState {
  final GithubRepositoryModel? gqlRepository;
  const LoadedGraphqlDataState({ this.gqlRepository});
}
